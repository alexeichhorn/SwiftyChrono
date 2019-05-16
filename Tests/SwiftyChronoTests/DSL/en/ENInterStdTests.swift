import XCTest
@testable import SwiftyChrono

class ENInterStdTests: ChronoTestCase {
    override var preferredLanguage: Language? { return .english }
    override var sixMinutesFixBefore1900: Bool? { return true }

    func testAll() {
        test("Test - Single Expression", {

            text = "Let's finish this before this 2013-2-7.";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2013, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 2, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 7, "Test Result - (Day) " + stringify(result.start))

            resultDate = (result.start.date());
            expectDate = (Date(2013,1,7,12));
            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)


            text = "1994-11-05T08:15:30-05:30";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 1994, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 8, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 15, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 30, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == -330, "Test Result - (Second) " + stringify(result.start))
            ok(result.text == text, result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 784043130000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)

            text = "1994-11-05T13:15:30";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 1994, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 15, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 30, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 0, "Test Result - (Timezone) " + stringify(result.start))
            ok(result.text == text, result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 784041330000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)

            text = "2015-07-31T12:00:00";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2015, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 7, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 31, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 12, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 0, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 0, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 0, "Test Result - (Timezone) " + stringify(result.start))
            ok(result.text == text, result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 1438344000000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)


            text = "1994-11-05T13:15:30Z";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 1994, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 15, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 30, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 0, "Test Result - (Second) " + stringify(result.start))
            ok(result.text == text, result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 784041330000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)

            text = "1994-11-05T13:15:30Z";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 1994, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 15, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 30, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 0, "Test Result - (Second) " + stringify(result.start))
            ok(result.text == text, result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 784041330000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)


            text = "- 1994-11-05T13:15:30Z";
            results = chrono.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 1994, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 11, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 5, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 13, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 15, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 30, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 0, "Test Result - (Second) " + stringify(result.start))

            ok(result.index == 2, result.index)
            ok(result.text == "1994-11-05T13:15:30Z", result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 784041330000);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)

            text = "2016-05-07T23:45:00.487+01:00";
            results = strict.parse(text, Date(2012,7,8));
            ok(results.length == 1, stringify( results ))

            result = results[0];
            ok(result.start, stringify(result.start))
            ok(result.start.get("year") == 2016, "Test Result - (Year) " + stringify(result.start))
            ok(result.start.get("month") == 5, "Test Result - (Month) " + stringify(result.start))
            ok(result.start.get("day") == 7, "Test Result - (Day) " + stringify(result.start))
            ok(result.start.get("hour") == 23, "Test Result - (Hour) " + stringify(result.start))
            ok(result.start.get("minute") == 45, "Test Result - (Minute) " + stringify(result.start))
            ok(result.start.get("second") == 00, "Test Result - (Second) " + stringify(result.start))
            ok(result.start.get("timezoneOffset") == 60, "Test Result - (Timezone) " + stringify(result.start))

            ok(result.text == "2016-05-07T23:45:00.487+01:00", result.text)

            resultDate = result.start.date();
            expectDate = Date(millisecondsFromEpoch: 1462661100487);

            ok(Math.abs(expectDate.getTime() - resultDate.getTime()) < 100000, "Test result.start.date() " + resultDate + "/" + expectDate)
        });


        test("Test - Compare with native js", {

            text = "1994-11-05T13:15:30Z";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)

            text = "1994-02-28T08:15:30-05:30";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)

            text = "1994-11-05T08:15:30-05:30";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)


            text = "1994-11-05T08:15:30+11:30";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)


            text = "2014-11-30T08:15:30-05:30";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)


            text = "Sat, 21 Feb 2015 11:50:48 -0500";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)


            text = "22 Feb 2015 04:12:00 -0000";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)

            //    text = "0000-01-01T00:00:00-01:00";
            //    result = chrono.parse(text)[0];
            //    expect = Date(string: text);
            //
            //    ok(result.text == text);
            //    ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)


            //    text = "0000-01-01T00:00:00-00:00";
            //    result = chrono.parse(text)[0];
            //    expect = Date(string: text);
            //
            //    ok(result.text == text);
            //    ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)

            text = "9999-12-31T23:59:00-00:00";
            result = chrono.parse(text)[0];
            expect = Date(string: text);

            ok(result.text == text);
            ok(Math.abs(expect.getTime() - result.start.date().getTime()) <= 1000)
        });
    }
}
