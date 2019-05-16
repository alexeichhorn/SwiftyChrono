import XCTest
@testable import SwiftyChrono

class ChronoTestCase: XCTestCase {
    var preferredLanguage: Language? { return nil }
    var sixMinutesFixBefore1900: Bool? { return nil }

    var chrono: Chrono!
    var strict: Chrono!
    var casual: Chrono!

    var text: String!
    var results: [ParsedResult]!
    var result: ParsedResult!
    var expect: Date!
    var expectDate: Date!
    var resultDate: Date!

    override func setUp() {
        super.setUp()
        if let sixMinutesFixBefore1900 = self.sixMinutesFixBefore1900 {
            Chrono.sixMinutesFixBefore1900 = sixMinutesFixBefore1900
        }
        chrono = Chrono()
        chrono.preferredLanguage = preferredLanguage
        strict = Chrono.strict
        strict.preferredLanguage = preferredLanguage
        casual = Chrono.casual
        casual.preferredLanguage = preferredLanguage
    }

    override func tearDown() {
        Chrono.sixMinutesFixBefore1900 = false
        chrono = nil
        strict = nil
        casual = nil
        text = nil
        results = nil
        result = nil
        expect = nil
        expectDate = nil
        resultDate = nil
        super.tearDown()
    }
    
    func test(_ title: String, _ exercise: () -> Void) {
        print(title)
        exercise()
    }
    
    func stringify(_ object: Any?) -> String {
        guard let object = object else { return "nil" }
        return "\(object)"
    }
    
    //func ok(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
    //    XCTAssertTrue(expression, message, file: file, line: line)
    //}

    func ok<T>(_ value: Optional<T>, _ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) {
        XCTAssertNotNil(value, message, file: file, line: line)
    }

    func ok<T>(_ value: Optional<T>, _ index: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertNotNil(value, "\(index)", file: file, line: line)
    }
}
