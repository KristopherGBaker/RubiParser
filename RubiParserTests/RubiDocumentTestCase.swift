//
//  RubiDocumentTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/18/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

@testable import RubiParser
import XCTest

/// Tests for RubiDocument.
class RubiDocumentTestCase: XCTestCase {

    /// Tests the initializer.
    func testInit() {
        let tokyo = RubiNode.ruby(kanji: "東京", reading: "とうきょう")
        let ga = RubiNode.text(text: "が")
        let dai = RubiNode.ruby(kanji: "大", reading: "だい")
        let su = RubiNode.ruby(kanji: "好", reading: "す")
        let ki = RubiNode.text(text: "き")
        let paragraph = RubiNode.paragraph(children: [tokyo, ga, dai, su, ki])

        let doc = RubiDocument(items: [paragraph])

        XCTAssert(doc.items.count == 1)

        if case RubiNode.paragraph(children: let children) = doc.items[0] {
            XCTAssert(children.count == 5)
        } else {
            XCTFail("unexpected items")
        }
    }

}
