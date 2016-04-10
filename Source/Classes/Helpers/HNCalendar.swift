//
//  HNCalendar.swift
//  HNCalendarView
//
//  Created by Harry Ng on 9/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Foundation

class HNCalendar {
    
    static let Week:[String] = NSDateFormatter().shortWeekdaySymbols as [String]
    static let Month:[String] = NSDateFormatter().shortMonthSymbols as [String]
    
}

extension NSDate {
    private class func componentFlags() -> NSCalendarUnit {
        return [NSCalendarUnit.Year ,
                NSCalendarUnit.Month ,
                NSCalendarUnit.Day,
                NSCalendarUnit.WeekOfYear,
                NSCalendarUnit.Hour ,
                NSCalendarUnit.Minute ,
                NSCalendarUnit.Second ,
                NSCalendarUnit.Weekday ,
                NSCalendarUnit.WeekdayOrdinal,
                NSCalendarUnit.WeekOfYear]
    }
    
    /// Return the NSDateComponents which represent current date
    var components: NSDateComponents {
        return  NSCalendar.currentCalendar().components(NSDate.componentFlags(), fromDate: self)
    }
    
    func monthDays () -> Int {
        return NSCalendar.currentCalendar().rangeOfUnit(NSCalendarUnit.Day, inUnit: NSCalendarUnit.Month, forDate: self).length
    }
    
}