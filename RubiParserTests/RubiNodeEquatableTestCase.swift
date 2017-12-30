//
//  RubiNodeEquatableTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

@testable import RubiParser
import XCTest

/// Tests the Equatable implementation on RubiNode.
class RubiNodeEquatableTestCase: XCTestCase {

    /// Tests equality for RubiNode.ruby.
    func testRubyEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.ruby(kanji: "東京", reading: "とうきょう")

        XCTAssert(tokyo == tokyo2)
    }

    /// Tests inequality for RubiNode.ruby.
    func testRubyNotEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let kyoto = RubiNode.ruby(kanji: "京都", reading: "きょうと")

        XCTAssert(tokyo != kyoto)
    }

    /// Tests equality for RubiNode.word.
    func testWordEqual() {
        let arigatou = RubiNode.word(text: "ありがとう")
        let arigatou2 = RubiNode.word(text: "ありがとう")

        XCTAssert(arigatou == arigatou2)
    }

    /// Tests inequality for RubiNode.word.
    func testWordNotEqual() {
        let arigatou = RubiNode.word(text: "ありがとう")
        let konnichiwa = RubiNode.word(text: "こんにちは")

        XCTAssert(arigatou != konnichiwa)
    }

    /// Tests equality for RubiNode.text.
    func testTextEqual() {
        let ga = RubiNode.text(text: "が")
        let ga2 = RubiNode.text(text: "が")

        XCTAssert(ga == ga2)
    }

    /// Tests inequality for RubiNode.text.
    func testTextNotEqual() {
        let ga = RubiNode.text(text: "が")
        let wo = RubiNode.text(text: "を")

        XCTAssert(ga != wo)
    }

    /// Tests equality for RubiNode.paragraph.
    func testParagraphEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.paragraph(children: [tokyo])

        let tokyo2 = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let paragraph2 = RubiNode.paragraph(children: [tokyo2])

        XCTAssert(paragraph == paragraph2)
    }

    /// Tests inequality for RubiNode.paragraph.
    func testParagraphNotEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.paragraph(children: [tokyo])

        let kyoto = RubiNode.ruby(kanji: "京都", reading: "きょうと")
        let paragraph2 = RubiNode.paragraph(children: [kyoto])

        XCTAssert(paragraph != paragraph2)
    }

    /// Tests inequality for RubiNode.ruby and RubiNode.word.
    func testRubyWordNotEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.word(text: "東京")

        XCTAssert(tokyo != tokyo2)
    }

    /// Tests inequality for RubiNode.ruby and RubiNode.text.
    func testRubyTextNotEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let tokyo2 = RubiNode.text(text: "東京")

        XCTAssert(tokyo != tokyo2)
    }

    /// Tests inequality for RubiNode.ruby and RubiNode.paragraph.
    func testRubyParagraphNotEqual() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let paragraph = RubiNode.paragraph(children: [tokyo])

        XCTAssert(tokyo != paragraph)
    }

    /// Tests inequality for RubiNode.word and RubiNode.text.
    func testWordTextNotEqual() {
        let tokyo = RubiNode.word(text: "東京")
        let tokyo2 = RubiNode.text(text: "東京")

        XCTAssert(tokyo != tokyo2)
    }

    /// Tests inequality for RubiNode.word and RubiNode.paragraph.
    func testWordParagraphNotEqual() {
        let tokyo = RubiNode.word(text: "東京")
        let paragraph = RubiNode.paragraph(children: [tokyo])

        XCTAssert(tokyo != paragraph)
    }

    /// Tests inequality for RubiNode.word and RubiNode.text.
    func testTextParagraphNotEqual() {
        let tokyo = RubiNode.text(text: "東京")
        let paragraph = RubiNode.paragraph(children: [tokyo])

        XCTAssert(tokyo != paragraph)
    }
}
