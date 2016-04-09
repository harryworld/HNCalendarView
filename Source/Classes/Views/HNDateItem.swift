//
//  HNDateItem.swift
//  HNCalendarView
//
//  Created by Harry Ng on 8/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class HNDateItem: NSCollectionViewItem {

    @IBOutlet weak var dateField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func configure(day: Int) {
        dateField.stringValue = "\(day)"
    }
    
}
