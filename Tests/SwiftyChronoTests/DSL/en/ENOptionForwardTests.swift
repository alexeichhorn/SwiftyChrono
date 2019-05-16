import XCTest
@testable import SwiftyChrono

class ENOptionForwardTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Year Guessing", {

            // Parsing "January" on February (2016-02-15)
            text = "January 1st";

            result = casual.parse(text, Date(2016, 2-1, 15))[0];
            ok(result);
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 1, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start));

            result = casual.parse(text, Date(2016, 2-1, 15), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2017, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 1, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 1, "Test Result - (Day) " + stringify(result.start));
        });

        test("Test - Year Guessing (Range)", {

            // Parsing "February" on March (2016-02-15)
            text = "22-23 Feb at 7pm";

            result = casual.parse(text, Date(2016, 3-1, 15))[0];
            ok(result);
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 2, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 22, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("hour") == 19, "Test Result - (Hour) " + stringify(result.start));

            ok(result.end.get("year") == 2016, "Test Result - (Year) " + stringify(result.end));
            ok(result.end.get("month") == 2, "Test Result - (Month) " + stringify(result.end));
            ok(result.end.get("day") == 23, "Test Result - (Day) " + stringify(result.end));
            ok(result.end.get("hour") == 19, "Test Result - (Hour) " + stringify(result.end));

            result = casual.parse(text, Date(2016, 3-1, 15), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2017, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 2, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 22, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("hour") == 19, "Test Result - (Hour) " + stringify(result.start));

            ok(result.end.get("year") == 2017, "Test Result - (Year) " + stringify(result.end));
            ok(result.end.get("month") == 2, "Test Result - (Month) " + stringify(result.end));
            ok(result.end.get("day") == 23, "Test Result - (Day) " + stringify(result.end));
            ok(result.end.get("hour") == 19, "Test Result - (Hour) " + stringify(result.end));
        });

        test("Test - Year Guessing (Fixed)", {

            // Parsing "February" on March (2016-02-15)
            text = "22-23 Feb 2016 at 7pm";
            result = casual.parse(text, Date(2016, 3-1, 15), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 2, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 22, "Test Result - (Day) " + stringify(result.start));
            ok(result.start.get("hour") == 19, "Test Result - (Hour) " + stringify(result.start));

            ok(result.end.get("year") == 2016, "Test Result - (Year) " + stringify(result.end));
            ok(result.end.get("month") == 2, "Test Result - (Month) " + stringify(result.end));
            ok(result.end.get("day") == 23, "Test Result - (Day) " + stringify(result.end));
            ok(result.end.get("hour") == 19, "Test Result - (Hour) " + stringify(result.end));
        });

        test("Test - Weekday Guessing", {

            // Parsing "Monday" on Thursday (2012-08-09)
            text = "Monday";

            result = casual.parse(text, Date(2012, 8-1, 9))[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            result = casual.parse(text, Date(2012, 8-1, 9), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 13, "Test Result - (Day) " + stringify(result.start));
        });


        test("Test - Weekday Guessing (Range)", {

            // Parsing "Monday to Wednesday" on Thursday (2012-08-09)
            text = "Monday - Wednesday";

            result = casual.parse(text, Date(2012, 8-1, 9))[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 6, "Test Result - (Day) " + stringify(result.start));

            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.end.get("day") == 8, "Test Result - (Day) " + stringify(result.start));

            result = casual.parse(text, Date(2012, 8-1, 9), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 13, "Test Result - (Day) " + stringify(result.start));

            ok(result.end.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.end.get("month") == 8, "Test Result - (Month) " + stringify(result.start));
            ok(result.end.get("day") == 15, "Test Result - (Day) " + stringify(result.start));
        });


        test("Test - Weekday Guessing (Fixed)", {

            // Parsing "Monday" on Thursday (2012-08-09)
            text = "Monday last week";

            result = casual.parse(text, Date(2012, 8-1, 9))[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 30, "Test Result - (Day) " + stringify(result.start));

            result = casual.parse(text, Date(2012, 8-1, 9), [.forwardDate: 1])[0];
            ok(result);
            ok(result.start.get("year") == 2012, "Test Result - (Year) " + stringify(result.start));
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start));
            ok(result.start.get("day") == 30, "Test Result - (Day) " + stringify(result.start));
        });
    }
}
