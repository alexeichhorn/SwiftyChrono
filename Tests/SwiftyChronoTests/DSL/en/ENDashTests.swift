import XCTest
@testable import SwiftyChrono

class ENDashTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    
    func testAll() {
        test("Test - Should return false with euro style phone number", {
            text = "80-32-89-89";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ) )
        });
        
        test("Test - Should handle EN dayname mm-dd-yy", {
            text = "Friday 12-30-16";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
        });
        
        test("Test - Should handle EN mm-dd-yy", {
            text = "12-30-16";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
        });
        
        
        test("Test - Should handle EN dayname dd-mm-yy", {
            text = "Friday 30-12-16";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
        });
        
        test("Test - Should handle EN dd-mm-yy", {
            text = "30-12-16";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
        });
    }
}
