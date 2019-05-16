import XCTest
@testable import SwiftyChrono

class ENWeekdayTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        test("Test - Single Expression", {
            
            text = "Monday";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Monday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 1, "Test Result - (Weekday) " + stringify(result.start));
            
            
            ok(!result.start.isCertain("day"));
            ok(!result.start.isCertain("month"));
            ok(!result.start.isCertain("year"));
            ok(result.start.isCertain("weekday"));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 6, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "Monday (forward dates only)";
            results = casual.parse(text, Date(2012, 7, 9), [.forwardDate: 1]);
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Monday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 13, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 1, "Test Result - (Weekday) " + stringify(result.start));
            
            
            ok(!result.start.isCertain("day"));
            ok(!result.start.isCertain("month"));
            ok(!result.start.isCertain("year"));
            ok(result.start.isCertain("weekday"));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 13, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "Thursday";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Thursday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 9, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 4, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 9, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "Sunday";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sunday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 12, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 0, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is last Friday...";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 16, "Wrong index");
            ok(result.text == "last Friday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 3, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 5, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 3, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "The Deadline is past Friday...";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 16, "Wrong index");
            ok(result.text == "past Friday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 3, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 5, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 3, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "Let's have a meeting on Friday next week";
            results = casual.parse(text, Date(2015, 3, 18));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 21, "Wrong index");
            ok(result.text == "on Friday next week", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2015, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 24, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 5, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2015, 3, 24, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "I plan on taking the day off on Tuesday, next week";
            results = casual.parse(text, Date(2015, 3, 18));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 29, "Wrong index");
            ok(result.text == "on Tuesday, next week", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2015, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 21, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 2, "Test Result - (Weekday) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2015, 3, 21, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        test("Test - Weekday With Casual Time", {
            text = "Lets meet on Tuesday morning";
            results = casual.parse(text, Date(2015, 3, 18));
            ok(results.length == 1, stringify(results));
            result = results[0];
            ok(result.index == 10, "Wrong index");
            ok(result.text == "on Tuesday morning", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2015, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 21, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 2, "Test Result - (Weekday) " + stringify(result.start));
            ok(result.start.get("hour") == 6, "Test Result - (Hour) " + stringify(result.start));
            
            resultDate = result.start.date();
            expectDate = Date(2015, 3, 21, 6);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        test("Test - Weekday Overlap", {
            
            text = "Sunday, December 7, 2014";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sunday, December 7, 2014", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 12, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 7, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 0, "Test Result - (Weekday) " + stringify(result.start));
            
            
            ok(result.start.isCertain("day"));
            ok(result.start.isCertain("month"));
            ok(result.start.isCertain("year"));
            ok(result.start.isCertain("weekday"));
            
            resultDate = result.start.date();
            expectDate = Date(2014, 12 - 1, 7, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "Sunday 12/7/2014";
            results = casual.parse(text, Date(2012, 7, 9));
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "Sunday 12/7/2014", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 12, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 7, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 0, "Test Result - (Weekday) " + stringify(result.start));
            
            
            ok(result.start.isCertain("day"));
            ok(result.start.isCertain("month"));
            ok(result.start.isCertain("year"));
            ok(result.start.isCertain("weekday"));
            
            resultDate = result.start.date();
            expectDate = Date(2014, 12 - 1, 7, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        
        test("Test - forward dates only option", {
            
            text = "this Friday to this Monday";
            results = casual.parse(text, Date(2016, 8-1, 4), [.forwardDate: 1]);
            ok(results.length == 1, stringify(results));
            
            result = results[0];
            ok(result.index == 0, "Wrong index");
            ok(result.text == "this Friday to this Monday", result.text);
            
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("weekday") == 5, "Test Result - (Weekday) " + stringify(result.start));
            
            ok(!result.start.isCertain("day"));
            ok(!result.start.isCertain("month"));
            ok(!result.start.isCertain("year"));
            ok(result.start.isCertain("weekday"));
            
            resultDate = result.start.date();
            expectDate = Date(2016, 8-1, 5, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            ok(result.end, stringify(result.end));
            ok(result.end.get("year") == 2016, "Test Result - (Year) " + stringify(result.end));
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.end));
            ok(result.end.get("day") == 8, "Test Result - (Day) " + stringify(result.end));
            ok(result.end.get("weekday") == 1, "Test Result - (Weekday) " + stringify(result.end));
            
            ok(!result.end!.isCertain("day"));
            ok(!result.end!.isCertain("month"));
            ok(!result.end!.isCertain("year"));
            ok(result.end.isCertain("weekday"));
            
            resultDate = result.end.date();
            expectDate = Date(2016, 8-1, 8, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.end.date " + resultDate + "/" + expectDate)
        });
        
    }
}
