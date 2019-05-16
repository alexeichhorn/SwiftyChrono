import XCTest
@testable import SwiftyChrono

class ENCasualTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        let chrono = Chrono()
        
        test("Test - Single Expression", {
            
            
            text = "The Deadline is now";
            results = casual.parse(text, Date(2012, 7, 10, 8, 9, 10, 11));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 16, "Wrong index");
            XCTAssertTrue(result.text == "now", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 8, "Test Result - (Hour) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("minute") == 9, "Test Result - (Minute) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("second") == 10, "Test Result - (Second) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("millisecond") == 11, "Test Result - (Millisecond) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 8, 9, 10, 11);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is today";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 16, "Wrong index");
            XCTAssertTrue(result.text == "today", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is Tomorrow";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 16, "Wrong index");
            XCTAssertTrue(result.text == "Tomorrow", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 11, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 11, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            // Say.."Tomorrow" in the late night (1 AM)
            text = "The Deadline is Tomorrow";
            results = casual.parse(text, Date(2012, 7, 10, 1));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline was yesterday";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 17, "Wrong index");
            XCTAssertTrue(result.text == "yesterday", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 9, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 9, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline was last night ";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 17, "Wrong index");
            XCTAssertTrue(result.text == "last night", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 9, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 0, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 9, 0);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline was this morning ";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 17, "Wrong index");
            XCTAssertTrue(result.text == "this morning", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 6, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 6);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline was this afternoon ";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 17, "Wrong index");
            XCTAssertTrue(result.text == "this afternoon", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 15, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 15);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline was this evening ";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 17, "Wrong index");
            XCTAssertTrue(result.text == "this evening", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 18, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 18);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
        
        
        test("Test - Combined Expression", {
            
            
            text = "The Deadline is today 5PM";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 16, "Wrong index");
            XCTAssertTrue(result.text == "today 5PM", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 17, "Test Result - (Day) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 17);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
        
        
        test("Test - Casual date range", {
            
            text = "The event is today - next friday";
            results = casual.parse(text, Date(2012, 7, 4, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 13, "Wrong index");
            XCTAssertTrue(result.text == "today - next friday", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 4, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 4, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            XCTAssertNotNil(result.end, stringify(result.start) );
            XCTAssertTrue(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 10, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "The event is today - next friday";
            results = casual.parse(text, Date(2012, 7, 10, 12));
            XCTAssertTrue(results.length == 1, stringify( results ) );
            
            result = results[0];
            XCTAssertTrue(result.index == 13, "Wrong index");
            XCTAssertTrue(result.text == "today - next friday", result.text );
            
            XCTAssertNotNil(result.start, stringify(result.start) );
            XCTAssertTrue(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            XCTAssertNotNil(result.end, stringify(result.start) );
            XCTAssertTrue(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("day") == 17, "Test Result - (Day) " + stringify(result.start) );
            XCTAssertTrue(result.end.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 17, 12);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
        
        
        
        
        
        test("Test - Random text", {
            
            text = "tonight";
            result = chrono.parse(text, Date(2012, 1-1, 1, 12))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("year") == 2012, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("day") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("hour") == 22, stringify(result.start));
            XCTAssertTrue(result.start.get("meridiem")  == 1, stringify(result.start));
            
            text = "tonight 8pm";
            result = chrono.parse(text, Date(2012, 1-1, 1, 12))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("hour")  == 20, stringify(result.start));
            XCTAssertTrue(result.start.get("year")  == 2012, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("day")   == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("meridiem")  == 1, stringify(result.start));
            
            
            text = "tonight at 8";
            result = chrono.parse(text, Date(2012, 1-1, 1, 12))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("hour")  == 20, stringify(result.start));
            XCTAssertTrue(result.start.get("year")  == 2012, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("day")   == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("meridiem")  == 1, stringify(result.start));
            
            
            text = "tomorrow before 4pm";
            result = chrono.parse(text, Date(2012, 1-1, 1, 12))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("hour")  == 16, stringify(result.start));
            XCTAssertTrue(result.start.get("year")  == 2012, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("day")   == 2, stringify(result.start));
            XCTAssertTrue(result.start.get("meridiem")  == 1, stringify(result.start));
            
            
            text = "tomorrow after 4pm";
            result = chrono.parse(text, Date(2012, 1-1, 1, 12))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("hour")  == 16, stringify(result.start));
            XCTAssertTrue(result.start.get("year")  == 2012, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("day")   == 2, stringify(result.start));
            XCTAssertTrue(result.start.get("meridiem")  == 1, stringify(result.start));
            
            
            text = "thurs";
            result = chrono.parse(text)[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("weekday") == 4, result.text);
            
            
            text = "thurs";
            result = chrono.parse(text)[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("weekday") == 4, result.text)
            
            text = "this evening";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("year") == 2016, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 10, stringify(result.start));
            XCTAssertTrue(result.start.get("day") == 1, stringify(result.start));
            XCTAssertTrue(result.start.get("hour") == 18, stringify(result.start));
            
            text = "yesterday afternoon";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("year") == 2016, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 9, stringify(result.start));
            XCTAssertTrue(result.start.get("day") == 30, stringify(result.start));
            XCTAssertTrue(result.start.get("hour") == 15, stringify(result.start));
            
            text = "tomorrow morning";
            result = chrono.parse(text, Date(2016, 10-1, 1, 8))[0];
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(result.start.get("year") == 2016, stringify(result.start));
            XCTAssertTrue(result.start.get("month") == 10, stringify(result.start));
            XCTAssertTrue(result.start.get("day") == 2, stringify(result.start));
            XCTAssertTrue(result.start.get("hour") == 6, stringify(result.start));
        });
        
        
        test("Test - Random negative text", {
            
            text = "notoday";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) );
            
            
            text = "tdtmr";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) );
            
            text = "xyesterday";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) );
            
            text = "nowhere";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) );
            
            text = "noway";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) );
            
            text = "knowledge";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
        });
    }
}
