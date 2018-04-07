//
//  RubiParserTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/18/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

@testable import RubiParser
import XCTest

/// Tests for RubiParser.
class RubiParserTestCase: XCTestCase {

    /// The parser.
    internal var parser: RubiParser!

    /// The document.
    internal var doc: RubiDocument!

    /// Initialize parser.
    override func setUp() {
        super.setUp()

        parser = RubiScannerParser()
    }

    /// Tests parse for the EasyNews1 example.
    func testParse() {
        guard let html = loadExample(name: "EasyNews1") else {
            XCTFail("unable to load EasyNews1 example")
            return
        }

        doc = parser.parse(html)
        assertEasyNews1()
    }

    // Tests parse for the EasyNews2 example.
    func testParseWithImage() {
        guard let html = loadExample(name: "EasyNews2") else {
            XCTFail("unable to load EasyNews2 example")
            return
        }

        doc = parser.parse(html)
        assertEasyNews2()
        
        print(doc.kanjiString)
        print(doc.kanaString)
        
        doc.items.forEach { printNode(node: $0) }
        
        func printNode(node: RubiNode) {
            if case RubiNode.ruby(let kanji, let reading) = node {
                print("Kanji: \(kanji) \(reading)")
            }
            else if case RubiNode.word(let text) = node {
                print(text)
            }
            else if case RubiNode.text(let text) = node {
                print(text)
            }
            else if case RubiNode.image(let url) = node {
                print(url)
            }
            else if case RubiNode.paragraph(let children) = node {
                children.forEach { printNode(node: $0) }
            }
        }
    }

    /// Asserts the parsed EasyNews1 document is correct.
    func assertEasyNews1() {
        XCTAssertEqual(doc.items.count, 6)

        if case RubiNode.paragraph(children: let children) = doc.items[0] {
            XCTAssert(children.count == 33)

            if case RubiNode.text(text: let text) = children[0] {
                XCTAssert(text == "アメリカ")
            } else {
                XCTFail("unexpected items")
            }
        } else {
            XCTFail("unexpected items")
        }

        if case RubiNode.paragraph(children: let children) = doc.items[3] {
            XCTAssert(children.count == 25)

            if case RubiNode.ruby(kanji: let kanji, reading: let reading) = children[0] {
                XCTAssert(kanji == "東京都")
                XCTAssert(reading == "とうきょうと")
            } else {
                XCTFail("unexpected items")
            }
        } else {
            XCTFail("unexpected items")
        }
    }

    func assertEasyNews2() {
        XCTAssert(doc.items.count == 4)

        if case RubiNode.image(url: let url) = doc.items[0] {
            XCTAssert(url == URL(string: "http://www3.nhk.or.jp/news/easy/manu_still/baby.jpg"))
        }
    }
}
