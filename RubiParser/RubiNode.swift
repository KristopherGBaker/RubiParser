//
//  RubiNode.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

/// Represents a RubiDocument node.
public enum RubiNode {
    
    /// The paragraph type.
    indirect case Paragraph(children: [RubiNode])
    
    /// The ruby type.
    case Ruby(kanji: String, reading: String)
    
    /// The text type.
    case Text(text: String)
    
    /// The word type.
    case Word(text: String)
    
}

/// Implements the Equatable protocol for RubiNode.
extension RubiNode: Equatable {
    public static func ==(lhs: RubiNode, rhs: RubiNode) -> Bool {
        switch (lhs, rhs) {
        case (let .Ruby(kanji1, reading1), let .Ruby(kanji2, reading2)):
            return kanji1 == kanji2 && reading1 == reading2
            
        case (let .Text(text1), let .Text(text2)):
            return text1 == text2
            
        case (let .Word(word1), let .Word(word2)):
            return word1 == word2
            
        case (let .Paragraph(children1), let .Paragraph(children2)):
            return children1 == children2
            
        default:
            return false
        }
    }
}
