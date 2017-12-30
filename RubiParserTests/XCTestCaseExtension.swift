//
//  XCTestCaseExtension.swift
//  RubiParser
//
//  Created by Kris Baker on 12/17/16.
//  Copyright © 2016 Empyreal Night, LLC. All rights reserved.
//

import XCTest

/// XCTestCase extension methods.
extension XCTestCase {

    /**
     Loads the specified example from the current Bundle and returns the contents as a string.
     
     - Parameters:
        - name: The filename (without extension).
        - ofType: The file extension type.  The default is "html".
     
     - Returns:
        The example as a string if it could be loaded, nil otherwise.
     */
    func loadExample(name: String, ofType: String = "html") -> String? {
        let bundle = Bundle(for: type(of: self))

        if let path = bundle.path(forResource: name, ofType: ofType),
            let text: String = try? String(contentsOfFile: path) {
            return text
        }

        return nil
    }

}
