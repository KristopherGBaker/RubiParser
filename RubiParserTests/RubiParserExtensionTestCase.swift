//
//  RubiParserExtensionTestCase.swift
//  RubiParser
//
//  Created by Kris Baker on 12/19/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest
@testable import RubiParser

/// Tests for RubiParser extension methods.
extension RubiParserTestCase {
    
    /// Tests parseEasyNewsArticle.
    func testParseEasyNewsArticle() {
        guard let html = loadExample(name: "EasyNews1Full") else {
            XCTFail()
            return
        }
        
        doc = parser.parseEasyNewsArticle(html: html)
        assertEasyNews1()
    }
    
}
