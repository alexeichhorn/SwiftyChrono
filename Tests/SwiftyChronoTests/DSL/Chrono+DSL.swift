import XCTest
@testable import SwiftyChrono

func +(lhs: Date?, rhs: String) -> String {
    guard let lhs = lhs else { return "nil\(rhs)" }
    return "\(lhs)\(rhs)"
}

func +(lhs: String, rhs: Date?) -> String {
    guard let rhs = rhs else { return "\(lhs)nil" }
    return "\(lhs)\(rhs)"
}

func +(lhs: String, rhs: Int) -> String {
    return "\(lhs)\(rhs)"
}

extension Date {
    init(millisecondsFromEpoch: Double) {
        self = Date(timeIntervalSince1970: millisecondsFromEpoch/1000)
    }

    init?(string: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: string) else { return nil }
        self = date
    }
    
    init?(string: String) {
        if let date = Date(string: string, format: "E MMM dd yyyy HH:mm:ss 'GMT'Z") {
            self = date
        } else if let date = Date(string: string, format: "E, dd MMM yyyy HH:mm:ss zzz") {
            self = date
        } else if let date = Date(string: string, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ") {
            self = date
        } else if let date = Date(string: string, format: "yyyy-MM-dd'T'HH:mm:sszzz") {
            self = date
        } else if let date = Date(string: string, format: "dd MMM yyyy HH:mm:ss ZZZ") {
                self = date
        } else if let date = Date(string: string, format: "yyyy-MM-dd'T'HH:mm:ss") {
            self = date
        } else if let date = Date(string: string, format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ") {
            self = date
        } else {
            fatalError()
        }
    }
        
    func getTime() -> TimeInterval {
        return timeIntervalSinceReferenceDate
    }
}

extension Optional where Wrapped == ParsedComponents {
    func isCertain(_ component: String) -> Bool! {
        return self?.isCertain(component)
    }

    func get(_ component: String, calendar: Calendar = .current) -> Int? {
        return self?.get(component)
    }
    
    func date() -> Date? {
        return self?.date
    }
}

extension Optional where Wrapped == ParsedResult {
    var end: ParsedComponents? {
        return self?.end
    }
}

extension Optional where Wrapped == Date {
    func getTime() -> TimeInterval! {
        return self?.getTime()
    }
}

extension ParsedComponents {
    private func toComponent(_ component: String) -> ComponentUnit {
        if component == "year" {
            return .year
        } else if component == "month" {
            return .month
        } else if component == "day" {
            return .day
        } else if component == "weekday" {
            return .weekday
        } else if component == "hour" {
            return .hour
        } else if component == "minute" {
            return .minute
        } else if component == "second" {
            return .second
        } else if component == "millisecond" {
            return .millisecond
        } else if component == "meridiem" {
            return .meridiem
        } else if component == "timezoneOffset" {
            return .timeZoneOffset
        } else {
            fatalError()
        }
    }
    func isCertain(_ component: String) -> Bool {
        return isCertain(component: toComponent(component))
    }

    func get(_ component: String) -> Int? {
        let c = toComponent(component)
        return knownValues[c] ?? impliedValues[c]
    }
    
    func date() -> Date? {
        return self.date
    }
}

extension String {
    var length: Int {
        return count
    }
}

struct Math {
    static func abs(_ number: Double) -> Double {
        return Swift.abs(number)
    }
}

//struct JSON {
//    static func stringify(_ object: Any?) -> String {
//        guard let object = object else { return "nil" }
//        return "\(object)"
//    }
//}
