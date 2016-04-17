//
//  ViewController.swift
//  HNCalendarView
//
//  Created by Harry Ng on 4/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var containerView: NSView!
    let calendarView = HNCalendarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Step 1 - Override Style
        var preferences = HNCalendarView.Preferences()
        preferences.calendar.backgroundColor = NSColor.grayColor()
        preferences.calendar.textColor = NSColor.whiteColor()
        
        preferences.date.circleBackgroundColor = NSColor.yellowColor()
        preferences.date.dotColor = NSColor.greenColor()
        
        HNCalendarView.globalPreferences = preferences
        
        // Step 2 - Add calendar to view hierarchy
        addChildViewController(calendarView)
        calendarView.view.frame = containerView.frame
        view.addSubview(calendarView.view)
        
        // Step 3 - Set properties
        // Set selected date
        calendarView.selectedDate = NSDate()
        // Showing dots
        calendarView.counts = generateCounts()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func generateCounts() -> [Int] {
        
        var counts = [Int]()
        for i in 0..<NSDate().monthDays {
            counts.append(i % 2)
        }
        
        return counts
    }


}

