//
//  TestTests.swift
//  TestTests
//
//  Created by dos Santos, Diego on 18/01/21.
//

import XCTest
@testable import Test

class TestTests: XCTestCase {

    func compressString(text: String) -> String {
        var substring = ""
        var count = 0
        var lastChar = ""
        
        for char in text {
            if count == 0 {
                lastChar = "\(char)"
                count = 1
            } else if lastChar == "\(char)" {
                count+=1
            } else {
                substring = "\(substring)\(lastChar)\(count)"
                count = 1
                lastChar = "\(char)"
            }
        }
        
        if let last = text.last {
            substring = "\(substring)\(last)\(count)"
        }
        
        return substring.count > text.count ? text : substring
    }
    
    func testExample() throws {
        assert(self.compressString(text: "qwweeexxxxr") == "q1w2e3x4r1")
        assert(self.compressString(text: "") == "")
        assert(self.compressString(text: "A") == "A")
    }
}
