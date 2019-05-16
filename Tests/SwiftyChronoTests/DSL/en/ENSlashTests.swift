import XCTest
@testable import SwiftyChrono

class ENSlashTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        test("Test - Single Expression", {
            text = "The event is going ahead (04/2016)";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 26, "Wrong index")
            ok(result.text == "04/2016", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2016, 4-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "Published: 06/2004";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2004, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 6, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 11, "Wrong index")
            ok(result.text == "06/2004", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2004, 6-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "8/10/2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8/10/2012", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = ": 8/1/2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 2, "Wrong index")
            ok(result.text == "8/1/2012", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "8/10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8/10", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is 8/10/2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "8/10/2012", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "The Deadline is Tuesday 11/3/2015";
            results = chrono.parse(text, Date(2015,10,3));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "Tuesday 11/3/2015", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2015, 10, 3, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        
        test("Test - Single Expression Start with Year", {
            
            text = "2012/8/10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) )
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "2012/8/10", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is 2012/8/10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "2012/8/10", result.text )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
        
        
        test("Test - Range Expression", {
            
            
            text = "8/10/2012 - 8/15/2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8/10/2012 - 8/15/2012", result.text )
            
            ok(result.start, stringify(result.start) )
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start) )
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            ok(result.end, stringify(result.start) )
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start) )
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start) )
            ok(result.end.get("day") == 15, "Test Result - (Day) " + stringify(result.start) )
            
            resultDate = result.end.date();
            expectDate = Date(2012, 8-1, 15, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        test("Test - Random date patterns", {
            expectDate = Date(2015, 4, 25, 12, 0);
            
            text = "2015-05-25";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            text = "2015/05/25";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            text = "05-25-2015";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            text = "05/25/2015";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            text = "05.25.2015";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) );
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            // unambiguous date pattern
            text = "25/05/2015";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            // ambiguous US date pattern, expect 5th of June
            expectDate = Date(2015, 5, 5, 12, 0);
            text = "06/05/2015";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(2015, 7, 13, 12, 0);
            text = "2015.8.13";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(2015, 7, 13, 12, 0);
            text = "2015.08.13";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(2015, 7, 13, 12, 0);
            text = "2015.08.13";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(2007, 7, 13, 12, 0);
            text = "2007/8/13";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(2007, 7, 13, 12, 0);
            text = "2007/08/13";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            
            expectDate = Date(1999, 7, 13, 12, 0);
            text = "8/13/99";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            expectDate = Date(1989, 7, 13, 12, 0);
            text = "8/13/89";
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
            
            
        });
        
        
        test("Test - Impossible Date (Strict Mode)", {
            
            text = "8/32/2014";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ) )
            
            text = "8/32";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ) )
            
            text = "2/29/2014";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
            
            text = "2014/22/29";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
            
            text = "2014/13/22";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
        });
        
        
        test("Test - Impossible Dates (Casual Mode)", {
            
            text = "9/31/2015";
            expectDate = Date(2015, 9, 1, 12, 0);
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results) )
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
        });
    }
}
