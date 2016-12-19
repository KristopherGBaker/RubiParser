//
//  RubiDocumentEquatableTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest
@testable import RubiParser

/// Tests the Equatable implementation on RubiDocument.
class RubiDocumentEquatableTestCase: XCTestCase {
    
    /// Tests equality.
    func testEqual() {
        let doc1 = createExampleDocument()
        let doc2 = createExampleDocument()
        
        XCTAssert(doc1.items.count == 1)
        XCTAssert(doc1 == doc2)
    }
    
    /**
     Creates an example RubiDocument.
     
     - Returns:
        An example RubiDocument.
     */
    private func createExampleDocument() -> RubiDocument {
        let tokyo = RubiNode.Ruby(kanji: "東京", reading: "とうきょう")
        let ga = RubiNode.Text(text: "が")
        let dai = RubiNode.Ruby(kanji: "大", reading: "だい")
        let su = RubiNode.Ruby(kanji: "好", reading: "す")
        let ki = RubiNode.Text(text: "き")
        let paragraph = RubiNode.Paragraph(children: [tokyo, ga, dai, su, ki])
        
        return RubiDocument(items: [paragraph])
    }
    
    /// Tests inequality.
    func testNotEqual() {
        let doc1 = createExampleDocument()
        let doc2 = RubiDocument(items: [])
        
        XCTAssert(doc1 != doc2)
    }
}
