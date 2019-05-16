import XCTest
@testable import SwiftyChrono

class ENMiddleEndianTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Single Expression", {
            text = "She is getting married soon (July 2017).";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2017, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 29, "Wrong index")
            ok(result.text == "July 2017", result.text )

            resultDate = result.start.date();
            expectDate = Date(2017, 7-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "She is leaving in August.";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 18, "Wrong index")
            ok(result.text == "August", result.text )

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "I am arriving sometime in August, 2012, probably.";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 26, "Wrong index")
            ok(result.text == "August, 2012", result.text )

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 1, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "August 10, 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 0, "Wrong index")
            ok(result.text == "August 10, 2012", result.text )

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Nov 12, 2011";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2011, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 12, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 0, "Wrong index")
            ok(result.text == "Nov 12, 2011", result.text )

            resultDate = result.start.date();
            expectDate = Date(2011, 11-1, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "The Deadline is August 10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            ok(result.index == 16, "Wrong index")
            ok(result.text == "August 10", result.text )

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "The Deadline is August 10 2555 BE";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "August 10 2555 BE", result.text )

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            // --
            text = "The Deadline is August 10, 345 BC";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "August 10, 345 BC", result.text )

            resultDate = result.start.date();
            expectDate = Date(-345, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "The Deadline is August 10, 8 AD";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.index == 16, "Wrong index")
            ok(result.text == "August 10, 8 AD", result.text )

            resultDate = result.start.date();
            expectDate = Date(8, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
            // --

            text = "The Deadline is Tuesday, January 10";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.text == "Tuesday, January 10", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2013, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 1, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("weekday") == 2, "Test Result - (Weekday) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2013, 1-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Sun, Mar. 6, 2016";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));
            result = results[0];
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            text = "Sun, March 6, 2016";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));
            result = results[0];
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            text = "Sun., March 6, 2016";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));
            result = results[0];
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            text = "Sunday, March 6, 2016";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));
            result = results[0];
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            text = "Sunday, March 6, 2016";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));
            result = results[0];
            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 3, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));
        });

        test("Test - Range expression", {

            text = "August 10 - 22, 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "August 10 - 22, 2012", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 22, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2012, 8-1, 22, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "August 10 to 22, 2012";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "August 10 to 22, 2012", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 22, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2012, 8-1, 22, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "August 10 - November 12";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "August 10 - November 12", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 12, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2012, 11-1, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)

            text = "Aug 10 to Nov 12";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "Aug 10 to Nov 12", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2012, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 12, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2012, 11-1, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "Aug 10 - Nov 12, 2013";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "Aug 10 - Nov 12, 2013", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2013, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2013, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2013, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 12, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2013, 11-1, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            text = "Aug 10 - Nov 12, 2011";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ))

            result = results[0];

            ok(result.index == 0, "Wrong index")
            ok(result.text == "Aug 10 - Nov 12, 2011", result.text )

            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2011, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 10, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.start.date();
            expectDate = Date(2011, 8-1, 10, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)


            ok(result.end, stringify(result.end))
            ok(result.end.get("year") == 2011, "Test Result - (Year) " + stringify(result.start))
            ok(result.end.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.end.get("day") == 12, "Test Result - (Day) " + stringify(result.start))

            resultDate = result.end.date();
            expectDate = Date(2011, 11-1, 12, 12);
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.startDate " + resultDate + "/" + expectDate)
        });

        test("Test - Ordinal Words", {

            text = "May eighth, 2010";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));

            result = results[0];

            ok(result.index == 0, "Wrong index");
            ok(result.text == "May eighth, 2010", result.text );

            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2010, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 5, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 8, "Test Result - (Day) " + stringify(result.start));


            text = "May twenty-fourth";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));

            result = results[0];

            ok(result.index == 0, "Wrong index");
            ok(result.text == "May twenty-fourth", result.text );

            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 5, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 24, "Test Result - (Day) " + stringify(result.start));


            text = "May eighth - tenth, 2010";
            results = chrono.parse(text, Date(2012,7,10));
            ok(results.length == 1, stringify( results ));

            result = results[0];

            ok(result.index == 0, "Wrong index");
            ok(result.text == "May eighth - tenth, 2010", result.text );

            ok(result.start, stringify(result.start));
            ok(result.start.get("year") == 2010, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 5, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 8, "Test Result - (Day) " + stringify(result.start));

            ok(result.end, stringify(result.end));
            ok(result.end.get("year") == 2010, "Test Result - (Year) " + stringify(result.start));
            ok(result.end.get("month") == 5, "Test Result - (Month) " + stringify(result.start));
            ok(result.end.get("day") == 10, "Test Result - (Day) " + stringify(result.start));

        });

        test("Test - Impossible Dates (Strict Mode)", {

            text = "August 32, 2014";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))

            text = "Febuary 29, 2014";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))

            text = "August 32";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))

            text = "Febuary 29";
            results = strict.parse(text, Date(2012,7,10));
            ok(results.length == 0, stringify( results ))

        });

        test("Test - Impossible Dates (Casual Mode)", {

            text = "August 32, 2015";
            expectDate = Date(2015, 8, 1, 12, 0);
            results = chrono.parse(text);
            resultDate = results[0].start.date();
            ok(results.length == 1, stringify(results))
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 1000, resultDate + "/" + expectDate);
        });
    }
}
