//
//  RubiDocumentTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/18/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest
@testable import RubiParser

/// Tests for RubiDocument.
class RubiDocumentTestCase: XCTestCase {
    
    /// Tests the initializer.
    func testInit() {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let ga = RubiNode.Text(text: "が")
        let dai = RubiNode.Ruby(kanji: "大", reading: "だい")
        let su = RubiNode.Ruby(kanji: "好", reading: "す")
        let ki = RubiNode.Text(text: "き")
        let paragraph = RubiNode.Paragraph(children: [tokyo, ga, dai, su, ki])
        
        let doc = RubiDocument(items: [paragraph])
        
        XCTAssert(doc.items.count == 1)
        
        if case RubiNode.Paragraph(children: let children) = doc.items[0] {
            XCTAssert(children.count == 5)
        }
        else {
            XCTFail()
        }
    }
    
}
