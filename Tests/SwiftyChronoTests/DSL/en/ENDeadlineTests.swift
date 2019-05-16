import XCTest
@testable import SwiftyChrono

class ENDeadlineTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        test("Test - Single Expression", {
            
            text = "we have to do something in 5 days.";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 24, "Wrong index");
            ok(result.text == "in 5 days", result.text );
            
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 15, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 15, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "we have to do something in five days.";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 24, "Wrong index");
            ok(result.text == "in five days", result.text );
            
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 15, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 15, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "we have to do something within 10 day";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 24, "Wrong index");
            ok(result.text == "within 10 day", result.text );
            
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 20, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 20, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "in 5 minutes";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "in 5 minutes", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,19);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "within 1 hour";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within 1 hour", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,13,14);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "In 5 minutes I will go home";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "In 5 minutes", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,19);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "In 5 minutes A car need to move";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "In 5 minutes", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,19);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "In 5 seconds A car need to move";
            results = chrono.parse(text, Date(2012,7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "In 5 seconds", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12, 14, 5);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within half an hour";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within half an hour", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,44);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within two weeks";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within two weeks", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 24, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within a month";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within a month", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within a few months";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within a few months", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 10, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within one year";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within one year", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2013, 7, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within one Year";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within one Year", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2013, 7, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "within One year";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "within One year", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2013, 7, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "In 5 Minutes A car need to move";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "In 5 Minutes", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,19);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "In 5 mins a car need to move";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "In 5 mins", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,19);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "in a week";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 8, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));
            
        });
        
        
        test("Test - Single Expression (Strict)", {
            
            text = "within one year";
            results = strict.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 0, stringify( results ) );
            
            
            text = "within a few months";
            results = strict.parse(text, Date(2012, 8-1, 3));
            ok(results.length == 0, stringify( results ) )
            
            
            text = "within a few days";
            results = strict.parse(text, Date(2012, 8-1, 3));
            ok(results.length == 0, stringify( results ) )
        });
        
    }
}
