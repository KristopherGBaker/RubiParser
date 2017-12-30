//
//  RubiNode.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import Foundation

/// Represents a RubiDocument node.
public enum RubiNode {

    /// The image type.
    case image(url: URL)

    /// The paragraph type.
    indirect case paragraph(children: [RubiNode])

    /// The ruby type.
    case ruby(kanji: String, reading: String)

    /// The text type.
    case text(text: String)

    /// The word type.
    case word(text: String)

}

/// Implements the Equatable protocol for RubiNode.
extension RubiNode: Equatable {
    public static func == (lhs: RubiNode, rhs: RubiNode) -> Bool {
        switch (lhs, rhs) {
        case (let .image(url1), let .image(url2)):
            return url1 == url2

        case (let .ruby(kanji1, reading1), let .ruby(kanji2, reading2)):
            return kanji1 == kanji2 && reading1 == reading2

        case (let .text(text1), let .text(text2)):
            return text1 == text2

        case (let .word(word1), let .word(word2)):
            return word1 == word2

        case (let .paragraph(children1), let .paragraph(children2)):
            return children1 == children2

        default:
            return false
        }
    }
}
