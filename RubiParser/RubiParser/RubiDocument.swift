//
//  RubiDocument.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

/// Represents a document containing ruby characters.
public struct RubiDocument {
    
    /// The items - a list of the document elements.
    public let items: [RubiNode]
    
    /**
     Initializes a RubiDocument with the specified items.
     
     - Parameters:
     - items: The items representing the RubiDocument.
     
     - Returns:
     A new instance of a RubiDocument containing the specified items.
     */
    public init(items: [RubiNode]) {
        self.items = items
    }
    
}

/// Provides convenience properties for RubiDocument.
public extension RubiDocument {
    
    /// Returns a string representation of the document using kanji.
    public var kanjiString: String {
        return mapItems(items: items).joined(separator: "")
    }
    
    /**
     Maps the specified items to a string array.
     
     - Parameters:
     - items: The items to map.
     - useKana: Indicates if kana should be used (true) or kanji (false).
     The default is kanji/false.
     - Returns:
     A string array representing the mapped items.
     */
    private func mapItems(items: [RubiNode], useKana: Bool = false) -> [String] {
        return items.flatMap { item -> [String] in
            switch item {
            case .Ruby(kanji: let kanji, reading: let reading):
                return useKana ? [reading] : [kanji]
            case .Text(text: let text):
                return [text]
            case .Word(text: let word):
                return [word]
            case .Paragraph(children: let children):
                return mapItems(items: children, useKana: useKana)
            }
        }
    }
    
    /// Returns a string representation of the document using hiragana/katakana.
    public var kanaString: String {
        return mapItems(items: items, useKana: true).joined(separator: "")
    }
}

/// Implements the Equatable protocol for RubiDocument.
extension RubiDocument: Equatable {
    public static func ==(lhs: RubiDocument, rhs: RubiDocument) -> Bool {
        return lhs.items == rhs.items
    }
}
