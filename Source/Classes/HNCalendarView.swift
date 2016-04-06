//
//  HNCalendarView.swift
//  HNCalendarView
//
//  Created by Harry Ng on 5/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

public class HNCalendarView: NSViewController {
    
    public init() {
        super.init(nibName: "HNCalendarView", bundle: NSBundle(forClass: HNCalendarView.self))!
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override public func viewDidAppear() {
        
    }
    
}
