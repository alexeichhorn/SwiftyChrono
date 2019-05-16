import XCTest
@testable import SwiftyChrono

class ENTimeExpTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }
    
    func testAll() {
        test("Test - Single Expression", {
            
            
            text = "8:10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8:10", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 8, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 10, "Test Result - (Minute) " + stringify(result.start))
            
            
            ok(!result.start.isCertain("day"))
            ok(!result.start.isCertain("month"))
            ok(!result.start.isCertain("year"))
            ok(result.start.isCertain("hour"))
            ok(result.start.isCertain("minute"))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 8, 10);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "8:10 PM";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8:10 PM", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 20, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 10, "Test Result - (Minute) " + stringify(result.start))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 20, 10);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "1230pm";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "1230pm", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 30, "Test Result - (Minute) " + stringify(result.start))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 12, 30);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            text = "5:16p";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "5:16p", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 17, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 16, "Test Result - (Minute) " + stringify(result.start))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 17, 16);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "5:16 p.m.";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "5:16 p.m.", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 17, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 16, "Test Result - (Minute) " + stringify(result.start))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 17, 16);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = "Lets meet at 6.13 AM";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 10, "Wrong index")
            ok(result.text == "at 6.13 AM", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 6, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 13, "Test Result - (Minute) " + stringify(result.start))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 6, 13);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "1-3pm";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "1-3pm", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (Meridiem) " + stringify(result.start))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 13, 00);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            ok(result.end, stringify(result.start))
            ok(result.end.get("hour") == 15, "Test Result - (Hour) " + stringify(result.start))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.end.get("meridiem") == 1, "Test Result - (Meridiem) " + stringify(result.start))
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 10, 15, 00);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            
            text = "11pm-2";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "11pm-2", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 23, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (Meridiem) " + stringify(result.start))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 23, 00);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            ok(result.end, stringify(result.start))
            ok(result.end.get("hour") == 2, "Test Result - (Hour) " + stringify(result.start))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.end.get("meridiem") == 0, "Test Result - (Meridiem) " + stringify(result.start))
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 11, 2, 00);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
        });
        
        test("Test - Range Expression", {
            
            text = "8:10 - 12.32";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "8:10 - 12.32", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 8, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 10, "Test Result - (Minute) " + stringify(result.start))
            
            ok(!result.start.isCertain("day"))
            ok(!result.start.isCertain("month"))
            ok(!result.start.isCertain("year"))
            ok(result.start.isCertain("hour"))
            ok(result.start.isCertain("minute"))
            ok(!result.start.isCertain("second"))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 8, 10);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            ok(result.end, stringify(result.start))
            ok(result.end.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start))
            ok(result.end.get("minute") == 32, "Test Result - (Minute) " + stringify(result.start))
            
            ok(!result.end.isCertain("day"))
            ok(!result.end.isCertain("month"))
            ok(!result.end.isCertain("year"))
            ok(result.end.isCertain("hour"))
            ok(result.end.isCertain("minute"))
            ok(!result.end.isCertain("second"))
            ok(!result.end.isCertain("millisecond"))
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 10, 12, 32);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
            text = " from 6:30pm to 11:00pm ";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 1, "Wrong index")
            ok(result.text == "from 6:30pm to 11:00pm", result.text )
            
            ok(result.start, stringify(result.start))
            ok(result.start.get("hour") == 18, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 30, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (Meridiem) " + stringify(result.start))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 7, 10, 18, 30);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            ok(result.end, stringify(result.start))
            ok(result.end.get("hour") == 23, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("meridiem") == 1, "Test Result - (Meridiem) " + stringify(result.end))
            
            resultDate = result.end.date();
            expectDate = Date(2012, 7, 10, 23, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            
            
        });
        
        test("Test - Impossible", {
            
            text = "8:62";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
            
            text = "25:12";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
            
            text = "13.12 PM";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))
        });
        
        test("Test - Date + Time Expression", {
            
            text = "Something happen on 2014-04-18 3.00 AM";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 20, "Wrong index")
            ok(result.text == "2014-04-18 3.00 AM", result.text )
            
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 18, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 3, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2014, 4-1, 18, 3, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
            
            text = "Something happen on August 10, 2012 10:12:59 pm";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 20, "Wrong index")
            ok(result.text == "August 10, 2012 10:12:59 pm", result.text )
            
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 22, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 12, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 59, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 22, 12, 59);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
            
            text = "Something happen on 2014-04-18 7:00 - 8:00 AM...";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 20, "Wrong index")
            ok(result.text == "2014-04-18 7:00 - 8:00 AM", result.text )
            
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 18, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 7, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 0, "Test Result - (meridiem) " + stringify(result.start))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2014, 4-1, 18, 7, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
            
            
            ok(result.end.get("year") == 2014, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 4, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 18, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 8, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(result.end.get("meridiem") == 0, "Test Result - (meridiem) " + stringify(result.end))
            ok(!result.end.isCertain("millisecond"))
            
            resultDate = result.end.date();
            expectDate = Date(2014, 4-1, 18, 8, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
            
            
            
            text = "Something happen on 2014-04-18 7:00 - 8:00 PM...";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 20, "Wrong index")
            ok(result.text == "2014-04-18 7:00 - 8:00 PM", result.text )
            
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 18, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 19, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (meridiem) " + stringify(result.start))
            ok(!result.start.isCertain("millisecond"))
            
            resultDate = result.start.date();
            expectDate = Date(2014, 4-1, 18, 19, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
            
            
            ok(result.end.get("year") == 2014, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 4, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 18, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 20, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(result.end.get("meridiem") == 1, "Test Result - (meridiem) " + stringify(result.end))
            ok(!result.end.isCertain("millisecond"))
            
            resultDate = result.end.date();
            expectDate = Date(2014, 4-1, 18, 20, 0);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date " + resultDate + "/" + expectDate)
        })
        
        
        test("Test - Time Expression's Meridiem imply", {
            
            text = "1pm-3";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            ok(result.index == 0, "Wrong index")
            ok(result.text == "1pm-3", result.text )
            
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (meridiem) " + stringify(result.start))
            ok(result.start.isCertain("meridiem"), stringify(result))
            
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 11, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 3, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(!result.end.isCertain("meridiem"), stringify(result))
            
            text = "2014-04-18 1pm-3";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "2014-04-18 1pm-3", result.text )
            
            ok(result.start.get("year") == 2014, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 4, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 18, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (meridiem) " + stringify(result.start))
            ok(result.start.isCertain("meridiem"), stringify(result))
            
            ok(result.end.get("year") == 2014, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 4, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 19, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 3, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(!result.end.isCertain("meridiem"), stringify(result))
            
            
            text = "today from 1pm-3";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "today from 1pm-3", result.text )
            
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 1, "Test Result - (meridiem) " + stringify(result.start))
            ok(result.start.isCertain("meridiem"), stringify(result))
            
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 11, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 3, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(!result.end.isCertain("meridiem"), stringify(result))
            
            
            text = "today from 1am-3";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))
            
            result = results[0];
            
            ok(result.index == 0, "Wrong index")
            ok(result.text == "today from 1am-3", result.text )
            
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 1, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (second) " + stringify(result.start))
            ok(result.start.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.start))
            ok(result.start.get("meridiem") == 0, "Test Result - (meridiem) " + stringify(result.start))
            ok(result.start.isCertain("meridiem"), stringify(result))
            
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.end))
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.end))
            ok(result.end.get("day") == 10, "Test Result - (Day) " + stringify(result.end))
            ok(result.end.get("hour") == 3, "Test Result - (Hour) " + stringify(result.end))
            ok(result.end.get("minute") == 0, "Test Result - (Minute) " + stringify(result.end))
            ok(result.end.get("second") == 0, "Test Result - (second) " + stringify(result.end))
            ok(result.end.get("millisecond") == 0, "Test Result - (millisecond) " + stringify(result.end))
            ok(!result.end.isCertain("meridiem"), stringify(result))
            
        })
        
        
        test("Test - Timezone extraction", {
            
            text = "friday at 2 pm";
            result = chrono.parse(text, Date(2016, 3, 28))[0];
            ok(result.text == text, result.text)
            ok(!result.start.isCertain("timezoneOffset"), stringify(result.start))
            ok(result.start.get("timezoneOffset") == nil, stringify(result.start))
            
            
            text = "friday at 2 pm EST";
            result = chrono.parse(text, Date(2016, 3, 28))[0];
            ok(result.text == text, result.text)
            ok(result.start.isCertain("timezoneOffset"), stringify(result.start))
            ok(result.start.get("timezoneOffset") == -300, stringify(result.start))
            
            
            text = "friday at 2 pm est";
            result = chrono.parse(text, Date(2016, 3, 28))[0];
            ok(result.text == text, result.text)
            ok(result.start.isCertain("timezoneOffset"), stringify(result.start))
            ok(result.start.get("timezoneOffset") == -300, stringify(result.start))
            
            
            text = "friday at 2 pm establish ...";
            result = chrono.parse(text, Date(2016, 3, 28))[0];
            ok(result.text == "friday at 2 pm", result.text)
            ok(!result.start.isCertain("timezoneOffset"), stringify(result.start))
            ok(result.start.get("timezoneOffset") == nil, stringify(result.start))
            
            
            text = "friday at 2 pm I will do something";
            result = chrono.parse(text, Date(2016, 3, 28))[0];
            ok(result.text == "friday at 2 pm", result.text)
            ok(!result.start.isCertain("timezoneOffset"), stringify(result.start))
            ok(result.start.get("timezoneOffset") == nil, stringify(result.start))
        })
        
        
        test("Test - Random date + time expression", {
            
            text = "monday 4/29/2013 630-930am";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "wednesday 5/1/2013 1115am";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "friday 5/3/2013 1230pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            
            text = "sunday 5/6/2013  750am-910am";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "monday 5/13/2013 630-930am";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "wednesday 5/15/2013 1030am";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "friday 6/21/2013 2:30";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "tuesday 7/2/2013 1-230 pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "Monday, 6/24/2013, 7:00pm - 8:30pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "Thursday6/20/2013 from 7:00 PM to 10:00 PM";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "Wednesday, July 03, 2013 2pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            
            text = "6pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "6 pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "7-10pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "11.1pm";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "that I need to know or am I covered?";
            results = chrono.parse(text);
            ok(results.length == 0, stringify(results))
            
            text = "at 12";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            
            text = "at noon";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
            ok(result.start.get("hour") == 12, stringify(result.start))
            ok(result.start.get("hour") == 12, stringify(result.start))
            
            text = "at midnight";
            result = chrono.parse(text)[0];
            ok(result.text == text, result.text)
        })
        
    }
}
