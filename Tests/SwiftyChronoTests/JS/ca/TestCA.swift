//
//  TestCa.swift
//  SwiftyChrono
//
//  Translated from TestES.swift.
//  Original work Copyright © 2017 Potix. All rights reserved.
//

import XCTest
import JavaScriptCore
@testable import SwiftyChrono

class TestCA: ChronoJSXCTestCase {
    private let files = [
        "test_ca_casual",
        "test_ca_dash",
        "test_ca_deadline",
        "test_ca_little_endian",
        "test_ca_slash",
        "test_ca_time_ago",
        "test_ca_time_exp",
    ]
    
    func testExample() {
        Chrono.sixMinutesFixBefore1900 = true
        
        for fileName in files {
            let js = try! String(contentsOfFile: resourcePath(name: fileName, type: "js"))
            evalJS(js, fileName: fileName)
        }
    }
}
