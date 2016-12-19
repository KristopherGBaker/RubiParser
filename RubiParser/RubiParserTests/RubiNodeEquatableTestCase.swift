//
//  RubiNodeEquatableTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest
@testable import RubiParser

/// Tests the Equatable implementation on RubiNode.
class RubiNodeEquatableTestCase: XCTestCase {
    
    /// Tests equality for RubiNode.Ruby.
    func testRubyEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        
        XCTAssert(tokyo == tokyo2)
    }
    
    /// Tests inequality for RubiNode.Ruby.
    func testRubyNotEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let kyoto = RubiNode.Ruby(kanji: "京都", reading: "きょうと")
        
        XCTAssert(tokyo != kyoto)
    }
    
    /// Tests equality for RubiNode.Word.
    func testWordEqual() {
        let arigatou = RubiNode.Word(text: "ありがとう")
        let arigatou2 = RubiNode.Word(text: "ありがとう")
        
        XCTAssert(arigatou == arigatou2)
    }
    
    /// Tests inequality for RubiNode.Word.
    func testWordNotEqual() {
        let arigatou = RubiNode.Word(text: "ありがとう")
        let konnichiwa = RubiNode.Word(text: "こんにちは")
        
        XCTAssert(arigatou != konnichiwa)
    }
    
    /// Tests equality for RubiNode.Text.
    func testTextEqual() {
        let ga = RubiNode.Text(text: "が")
        let ga2 = RubiNode.Text(text: "が")
        
        XCTAssert(ga == ga2)
    }
    
    /// Tests inequality for RubiNode.Text.
    func testTextNotEqual() {
        let ga = RubiNode.Text(text: "が")
        let wo = RubiNode.Text(text: "を")
        
        XCTAssert(ga != wo)
    }
    
    /// Tests equality for RubiNode.Paragraph.
    func testParagraphEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.Paragraph(children: [tokyo])
        
        let tokyo2 = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let paragraph2 = RubiNode.Paragraph(children: [tokyo2])
        
        XCTAssert(paragraph == paragraph2)
    }
    
    /// Tests inequality for RubiNode.Paragraph.
    func testParagraphNotEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.Paragraph(children: [tokyo])
        
        let kyoto = RubiNode.Ruby(kanji: "京都", reading: "きょうと")
        let paragraph2 = RubiNode.Paragraph(children: [kyoto])
        
        XCTAssert(paragraph != paragraph2)
    }
    
    /// Tests inequality for RubiNode.Ruby and RubiNode.Word.
    func testRubyWordNotEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.Word(text: "東京")
        
        XCTAssert(tokyo != tokyo2)
    }
    
    /// Tests inequality for RubiNode.Ruby and RubiNode.Text.
    func testRubyTextNotEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.Text(text: "東京")
        
        XCTAssert(tokyo != tokyo2)
    }
    
    /// Tests inequality for RubiNode.Ruby and RubiNode.Paragraph.
    func testRubyParagraphNotEqual() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.Paragraph(children: [tokyo])
        
        XCTAssert(tokyo != paragraph)
    }
    
    /// Tests inequality for RubiNode.Word and RubiNode.Text.
    func testWordTextNotEqual() {
        let tokyo = RubiNode.Word(text: "東京")
        let tokyo2 = RubiNode.Text(text: "東京")
        
        XCTAssert(tokyo != tokyo2)
    }
    
    /// Tests inequality for RubiNode.Word and RubiNode.Paragraph.
    func testWordParagraphNotEqual() {
        let tokyo = RubiNode.Word(text: "東京")
        let paragraph = RubiNode.Paragraph(children: [tokyo])
        
        XCTAssert(tokyo != paragraph)
    }
    
    /// Tests inequality for RubiNode.Word and RubiNode.Text.
    func testTextParagraphNotEqual() {
        let tokyo = RubiNode.Text(text: "東京")
        let paragraph = RubiNode.Paragraph(children: [tokyo])
        
        XCTAssert(tokyo != paragraph)
    }
}
