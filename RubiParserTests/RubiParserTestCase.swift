//
//  RubiParserTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/18/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest
@testable import RubiParser

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
            XCTFail()
            return
        }
        
        doc = parser.parse(html)
        assertEasyNews1()
    }
    
    /// Asserts the parsed EasyNews1 document is correct.
    func assertEasyNews1() {
        XCTAssert(doc.items.count == 6)
        
        if case RubiNode.Paragraph(children: let children) = doc.items[0] {
            XCTAssert(children.count == 15)
            
            if case RubiNode.Word(text: let word) = children[0] {
                XCTAssert(word == "スウェーデン")
            }
            else {
                XCTFail()
            }
        }
        else {
            XCTFail()
        }
        
        if case RubiNode.Paragraph(children: let children) = doc.items[3] {
            XCTAssert(children.count == 32)
            
            if case RubiNode.Ruby(kanji: let kanji, reading: let reading) = children[0] {
                XCTAssert(kanji == "今年")
                XCTAssert(reading == "ことし")
            }
            else {
                XCTFail()
            }
        }
        else {
            XCTFail()
        }
    }
}
