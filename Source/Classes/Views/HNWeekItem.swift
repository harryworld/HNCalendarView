//
//  HNWeekItem.swift
//  HNCalendarView
//
//  Created by Harry Ng on 8/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class HNWeekItem: NSCollectionViewItem {

    @IBOutlet weak var weekField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func configure(week: String) {
        weekField.stringValue = week
    }
    
}
