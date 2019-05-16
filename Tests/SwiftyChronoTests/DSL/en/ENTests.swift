import XCTest
@testable import SwiftyChrono

class ENTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Date + Time Expression", {
            text = "Something happen on 2014-04-18 13:00 - 16:00 as";
            results = chrono.parse(text, Date(2012,7,10));
            XCTAssertTrue(results.length == 1, stringify( results ) )
            XCTAssertTrue(results[0].text == "2014-04-18 13:00 - 16:00")
        });
        
        test("Test - Compare with native js", {
            
            text = "Sat Nov 05 1994 22:45:30 GMT+0900";
            result = chrono.parse(text)[0];
            expect = Date(string: text)!;
            
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(abs(expect.timeIntervalSinceReferenceDate - result.start.date.timeIntervalSinceReferenceDate) <= 1000)
            
            
            text = "Fri, 31 Mar 2000 07:00:00 UTC";
            result = chrono.parse(text)[0];
            expect = Date(string: text)!;
            
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(abs(expect.timeIntervalSinceReferenceDate - result.start.date.timeIntervalSinceReferenceDate) <= 1000)
            
            text = "2014-12-14T18:22:14.759Z";
            result = chrono.parse(text)[0];
            expect = Date(string: text)!;
            
            XCTAssertTrue(result.text == text, result.text);
            XCTAssertTrue(abs(expect.timeIntervalSinceReferenceDate - result.start.date.timeIntervalSinceReferenceDate) < 0.0001)
        });
        
        
        test("Test - Random text", {
            
            text = "Adam <Adam@supercalendar.com> написал(а):\nThe date is 02.07.2013";
            result = chrono.parse(text, Date(2013,5,22,3,33))[0];
            XCTAssertTrue(result.text == "02.07.2013", result.text)
            
            text = "174 November 1,2001- March 31,2002";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text == "November 1,2001- March 31,2002", stringify(results) )
            
            
            text = "...Thursday, December 15, 2011 Best Available Rate "
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].start.get("year") == 2011, stringify(results) )
            
            
            text = "SUN 15SEP 11:05 AM - 12:50 PM"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text.length == 29, stringify(results) )
            
            text = "SUN 15SEP 11:05 AM – 12:50 PM"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].end != nil, stringify(results) )
            
            text = "FRI 13SEP 1:29 PM - FRI 13SEP 3:29 PM"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].start.get("hour") == 13, stringify(results) )
            XCTAssertTrue(results[0].end.get("hour") == 15, stringify(results) )
            
            text = "9:00 AM to 5:00 PM, Tuesday, 20 May 2013"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].start.get("hour") == 9, stringify(results) )
            XCTAssertTrue(results[0].end.get("hour") == 17, stringify(results) )
            XCTAssertTrue(results[0].end.get("meridiem") == 1, stringify(results))
            
            
            resultDate = results[0].start.date;
            expectDate = Date(2013, 4, 20, 9, 0);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate)
            
            resultDate = results[0].end.date();
            expectDate = Date(2013, 4, 20, 17, 0);
            XCTAssertTrue(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate)
            
            text = "2014-07-07T04:00:00Z"
            results = chrono.parse(text);
            
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text == "2014-07-07T04:00:00Z", stringify(results))
            
            
            text = "1.5.3 - 2015-09-24";
            results = chrono.parse(text);
            
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text == "2015-09-24", stringify(results))
            
            
            text = "1.5.30 - 2015-09-24";
            results = chrono.parse(text);
            
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text == "2015-09-24", stringify(results))
            
            
            text = "1.50.30 - 2015-09-24";
            results = chrono.parse(text);
            
            XCTAssertTrue(results.length == 1, stringify(results) )
            XCTAssertTrue(results[0].text == "2015-09-24", stringify(results))
            
        })
        
        test("Test - Random non-date patterns", {
            
            text = " 3"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "       1"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "  11 "
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = " 0.5 "
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = " 35.49 "
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "12.53%"
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "6358fe2310> *5.0* / 5 Outstanding";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "6358fe2310> *1.5* / 5 Outstanding";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "Total: $1,194.09 [image: View Reservation";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "Version: 1.1.3";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "Version: 1.1.30";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
            text = "Version: 1.10.30";
            results = chrono.parse(text);
            XCTAssertTrue(results.length == 0, stringify(results) )
            
        });
        
        
        test("Test - Wikipedia Texts", {
            
            text = "October 7, 2011, of which details were not revealed out of respect to Jobs\"s family.[239] Apple announced on the same day that they had no plans for a public service, but were encouraging \"well-wishers\" to send their remembrance messages to an email address created to receive such messages.[240] Sunday, October 16, 2011";
            results = chrono.parse(text, Date(2012,7,10));
            
            XCTAssertTrue(results.length == 2, text )
            XCTAssertTrue(results.length == 2, stringify( results ) )
            
            result = results[0];
            XCTAssertTrue( result.start.get("year") == 2011 &&
                result.start.get("month") == 10 &&
                result.start.get("day")   == 7,
                           stringify(result.start));
            
            XCTAssertTrue(result.index == 0, "Index : " + result.index)
            XCTAssertTrue(result.text == "October 7, 2011", "Text :" + result.text )
            
            result = results[1];
            XCTAssertTrue( result.start.get("year") == 2011 &&
                result.start.get("month") == 10 &&
                result.start.get("day")   == 16,
                           stringify(result.start));
            
            XCTAssertTrue(result.index == 297, "Index : " + result.index)
            XCTAssertTrue(result.text == "Sunday, October 16, 2011", "Text :" + result.text )
        });
    }
}
