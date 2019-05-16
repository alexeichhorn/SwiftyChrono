import XCTest
@testable import SwiftyChrono

class ENTimeAgoTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        test("Test - Single Expression", {
            
            text = "5 days ago, we did something";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "5 days ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 5, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "10 days ago, we did something";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 31, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "10 days ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7-1, 31, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "15 minute ago";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "15 minute ago", result.text );
            ok(result.start.get("hour") == 11, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 59, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,11,59);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "15 minute earlier";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "15 minute earlier", result.text );
            ok(result.start.get("hour") == 11, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 59, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,11,59);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "15 minute before";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "15 minute before", result.text );
            ok(result.start.get("hour") == 11, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 59, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,11,59);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "   12 hours ago";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 3, "Wrong index");
            ok(result.text == "12 hours ago", result.text );
            ok(result.start.get("hour") == 0, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 14, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,0,14);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "   half an hour ago";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 3, "Wrong index");
            ok(result.text == "half an hour ago", result.text );
            ok(result.start.get("hour") == 11, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 44, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,11,44);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "12 hours ago I did something";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "12 hours ago", result.text );
            ok(result.start.get("hour") == 0, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 14, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,0,14);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "12 seconds ago I did something";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "12 seconds ago", result.text );
            ok(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 13, "Test Result - (Minute) " + stringify(result.start) );
            ok(result.start.get("second") == 48, "Test Result - (Second) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12, 13, 48);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "three seconds ago I did something";
            results = chrono.parse(text, Date(2012, 7, 10, 12, 14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "three seconds ago", result.text );
            ok(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 13, "Test Result - (Minute) " + stringify(result.start) );
            ok(result.start.get("second") == 57, "Test Result - (Second) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12, 13, 57);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "5 Days ago, we did something";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "5 Days ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 5, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "   half An hour ago";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 3, "Wrong index");
            ok(result.text == "half An hour ago", result.text );
            ok(result.start.get("hour") == 11, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 44, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,11,44);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "A days ago, we did something";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 9, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "A days ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 9, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "a min before";
            results = chrono.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "a min before", result.text );
            ok(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start) );
            ok(result.start.get("minute") == 13, "Test Result - (Minute) " + stringify(result.start) );
            
            resultDate = result.start.date();
            expectDate = Date(2012,7,10,12,13);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        
        test("Test - Single Expression (Casual)", {
            
            text = "5 months ago, we did something";
            results = chrono.parse(text, Date(2012, 8-1,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "5 months ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 3-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "5 years ago, we did something";
            results = chrono.parse(text, Date(2012, 8-1,10));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2007, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "5 years ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2007, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "a week ago, we did something";
            results = chrono.parse(text, Date(2012, 8-1, 3));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 27, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "a week ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7-1, 27, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "a few days ago, we did something";
            results = chrono.parse(text, Date(2012, 8-1, 3));
            ok(results.length == 1, stringify( results ) );
            
            result = results[0];
            ok(result.start, stringify(result.start) );
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) );
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start) );
            ok(result.start.get("day") == 31, "Test Result - (Day) " + stringify(result.start) );
            
            ok(result.index == 0, "Wrong index");
            ok(result.text == "a few days ago", result.text );
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7-1, 31, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
        
        test("Test - Single Expression (Strict)", {
            
            text = "15 minute before";
            results = strict.parse(text, Date(2012,7,10,12,14));
            ok(results.length == 0, stringify( results ) );
            
            text = "a week ago, we did something";
            results = strict.parse(text, Date(2012, 8-1, 3));
            ok(results.length == 0, stringify( results ) )
        });
    }
}
