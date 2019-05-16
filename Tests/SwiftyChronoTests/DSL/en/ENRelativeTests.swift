import XCTest
@testable import SwiftyChrono

class ENRelativeTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Single Expression", {

            text = "next week";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 8, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next 2 weeks";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 15, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last week";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 24, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last 2 weeks";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 17, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next day";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 2, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next 2 days";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 3, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last day";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 30, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last 2 days";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 29, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next month";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 11, stringify(result.start));
            ok(result.start.get("day") == 1, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next 2 months";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 12, stringify(result.start));
            ok(result.start.get("day") == 1, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last month";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 1, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "last 2 months";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 8, stringify(result.start));
            ok(result.start.get("day") == 1, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next few weeks";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 22, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next four weeks";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 10, stringify(result.start));
            ok(result.start.get("day") == 29, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "past week";
            result = chrono.parse(text, Date(2016, 10-1, 1))[0];
            ok(result.text == text, result.text);
            ok(result.start.get("year") == 2016, stringify(result.start));
            ok(result.start.get("month") == 9, stringify(result.start));
            ok(result.start.get("day") == 24, stringify(result.start));
            ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next week at 10-06-2016";
            results = chrono.parse(text, Date(2016, 10-1, 1));
            ok(results.length == 1, stringify( results ) )

            result = results[0];
                ok(result.text == text, result.text);
                ok(result.start.get("year") == 2016, stringify(result.start));
                ok(result.start.get("month") == 10, stringify(result.start));
                ok(result.start.get("day") == 6, stringify(result.start));
                ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next month at 11-06-2016";
            results = chrono.parse(text, Date(2016, 10-1, 1));
            ok(results.length == 1, stringify( results ) )

            result = results[0];
                ok(result.text == text, result.text);
                ok(result.start.get("year") == 2016, stringify(result.start));
                ok(result.start.get("month") == 11, stringify(result.start));
                ok(result.start.get("day") == 6, stringify(result.start));
                ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next year at Feb-2017";
            results = chrono.parse(text, Date(2016, 10, 10));
            ok(results.length == 1, stringify( results ) )

            result = results[0];
                ok(result.text == text, result.text);
                ok(result.start.get("year") == 2017, stringify(result.start));
                ok(result.start.get("month") == 2, stringify(result.start));
                ok(result.start.get("day") == 1, stringify(result.start));
                ok(result.start.get("hour") == 12, stringify(result.start));

            text = "next week (Dec 2016)";
            results = chrono.parse(text, Date(2016, 11, 27));
            ok(results.length == 1, stringify( results ) )

            result = results[0];
                ok(result.text == "next week (Dec 2016", result.text )
                ok(result.start.get("year") == 2016, stringify(result.start));
                ok(result.start.get("month") == 12, stringify(result.start));
                ok(result.start.get("day") == 1, stringify(result.start));
                ok(result.start.get("hour") == 12, stringify(result.start));

            text = "She is getting married next year (July 2013).";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ) )

            result = results[0];
                ok(result.start, stringify(result.start) )
                ok(result.start.get("year") == 2013, "Test Result - (Year) " + stringify(result.start) )
                ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start) )
                ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start) )

                ok(result.index == 23, "Wrong index")
                ok(result.text == "next year (July 2013", result.text )

                resultDate = result.start.date();
                expectDate = Date(2013, 7-1, 1, 12);
                ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });
            }
}
