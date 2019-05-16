import XCTest
@testable import SwiftyChrono

class ENMonthTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Month expression", {


            text = "September 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 0, "Wrong index");
            ok(result.text == "September 2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Sept 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sept 2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Sep 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sep 2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Sep. 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sep. 2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Sep-2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sep-2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "The date is Sep 2012 is the date";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );

            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 9, "Test Result - (Month) " + stringify(result.start) );

            ok(result.index == 12, "Wrong index");
            ok(result.text == "Sep 2012", result.text );

            resultDate = result.start.date();
            expectDate = Date(2012, 9-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });

    }
}
