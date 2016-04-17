//
//  HNMonthItem.swift
//  HNCalendarView
//
//  Created by Harry Ng on 7/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class HNMonthItem: NSCollectionViewItem {

    @IBOutlet weak var monthField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func configure(month: String, year: Int) {
        monthField.stringValue = "\(month) \(year)"
        monthField.textColor = HNCalendarView.globalPreferences.calendar.textColor
    }
    
}
