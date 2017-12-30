//
//  RubiParser.swift
//  RubiParser
//
//  Created by Kris Baker on 12/17/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import Foundation

/// RubiParser represents a type for parsing input text to RubiDocument.
public protocol RubiParser {

    /// Parses the specified html string into a RubiDocument.
    ///
    /// - Parameters:
    ///    - html: The input html string.
    /// - Returns:
    ///    A RubiDocument representing the input html.
    func parse(_ html: String) -> RubiDocument

}

/// Extension methods for RubiParser.
public extension RubiParser {

    /// Parses the specified html string into a RubiDocument.  The input html is assumed
    /// to be NHK Easy News flavored html including the full html document.
    ///
    /// - Parameters:
    ///    - html: The input html string.
    /// - Returns:
    ///    A RubiDocument representing the input html.
    public func parseEasyNewsArticle(html: String) -> RubiDocument {
        let scanner = Scanner(string: html)
        let divTag = "<div id=\"newsarticle\">"
        scanner.scanUpToString(str: divTag)
        scanner.scanString(str: divTag)

        if let articleHTML = scanner.scanUpToString(str: "</div>") {
            return parse(articleHTML)
        }

        return RubiDocument(items: [])
    }

}

/// Represents the default implementation of RubiParser.
public class RubiScannerParser: RubiParser {

    /// The node stack used by the parser.
    private var nodeStack = [RubiNode]()

    /// The scanner used by the parser.
    private var scanner: Scanner!

    /// Character set containing whitespaces, newlines, and the less than character.
    private let whitespaceLessThan = CharacterSet.whitespacesAndNewlines.union(CharacterSet(charactersIn: "<"))

    /// Initializes the parser.
    public init() {
    }

    /// Parses the specified html string into a RubiDocument.
    ///
    /// - Parameters:
    ///    - html: The input html string.
    /// - Returns:
    ///    A RubiDocument representing the input html.
    public func parse(_ html: String) -> RubiDocument {
        scanner = Scanner(string: html)
        nodeStack = []

        var done = false

        while !done {
            scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)

            if scanner.scanString(str: "<p>") != nil {
                scanParagraph()
            } else if scanner.scanString(str: "<span") != nil {
                scanSpan()
            } else if scanner.scanString(str: "<ruby>") != nil {
                scanRuby()
            } else if scanner.scanString(str: "</p>") != nil {
                closeParagraph()
            } else if scanner.scanString(str: "<img") != nil {
                scanImage()
            } else if scanner.scanString(str: "<") != nil {
                // ignore all other tags
                scanTag()
            } else if let text = scanner.scanUpToCharacters(from: whitespaceLessThan) {
                scanText(text: text)
            } else {
                done = true
            }
        }

        return RubiDocument(items: nodeStack)
    }

    /// Scans the remainder of a paragraph node.
    private func scanParagraph() {
        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        nodeStack.append(.paragraph(children: []))
    }

    /// Scans the remainder of span tag into a word node.
    private func scanSpan() {
        scanner.scanUpToString(str: ">")
        scanner.scanString(str: ">")

        if let text = scanner.scanUpToCharacters(from: whitespaceLessThan) {
            nodeStack.append(.word(text: text))
            scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        }

        scanner.scanString(str: "</span>")
    }

    /// Scans the remainder of the image tag into an image node.
    private func scanImage() {
        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        scanner.scanUpToString(str: "src=\"")
        scanner.scanString(str: "src=\"")

        if let src = scanner.scanUpToString(str: "\""), let url = URL(string: src) {
            nodeStack.append(.image(url: url))
        }

        scanner.scanUpToString(str: ">")
        scanner.scanString(str: ">")
    }

    /// Scans the remainder of a ruby tag into a ruby node.
    private func scanRuby() {
        var kanji: String?
        var reading: String?

        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)

        if scanner.scanString(str: "<span") != nil {
            kanji = scanRubySpan()
        } else if let text = scanner.scanUpToCharacters(from: whitespaceLessThan) {
            kanji = text
            scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        }

        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)

        if scanner.scanString(str: "<rt>") != nil {
            reading = scanReading()
        }

        scanner.scanUpToString(str: "</ruby>")
        scanner.scanString(str: "</ruby>")
        scanner.scanString(str: "</span>")

        if let kanji = kanji, let reading = reading {
            nodeStack.append(.ruby(kanji: kanji, reading: reading))
        }
    }

    /// Scans the reading for a ruby node.
    private func scanReading() -> String? {
        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        var reading: String?

        if let text = scanner.scanUpToCharacters(from: whitespaceLessThan) {
            reading = text
            scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        }

        scanner.scanString(str: "</rt>")

        return reading
    }

    /// Scans a span tag contained within a ruby tag.
    private func scanRubySpan() -> String? {
        scanner.scanUpToString(str: ">")
        scanner.scanString(str: ">")
        var kanji: String?

        if let text = scanner.scanUpToCharacters(from: whitespaceLessThan) {
            kanji = text
            scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
        }

        scanner.scanString(str: "</span>")

        return kanji
    }

    /// Closes a Paragraph by collapsing the node stack as children for the current Paragraph.
    private func closeParagraph() {
        let lastIndex = nodeStack.count - 1
        var index = lastIndex

        while index >= 0 {
            if case RubiNode.paragraph(children: _) = nodeStack[index] {
                let nextIndex = index + 1

                if index < lastIndex {
                    let children = Array(nodeStack[nextIndex...lastIndex])
                    nodeStack[index] = .paragraph(children: children)

                    if nextIndex <= lastIndex {
                        nodeStack.removeSubrange(nextIndex...lastIndex)
                    }
                }

                break
            }

            index -= 1
        }
    }

    /// Scans text into a text node.
    private func scanText(text: String) {
        nodeStack.append(.text(text: text))
        scanner.scanCharacters(from: CharacterSet.whitespacesAndNewlines)
    }

    /// Scans html tags that we don't care about.
    private func scanTag() {
        scanner.scanUpToString(str: ">")
        scanner.scanString(str: ">")
    }
}
