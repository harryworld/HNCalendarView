//
//  HNDateItemView.swift
//  HNCalendarView
//
//  Created by Harry Ng on 12/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

@IBDesignable class HNDateItemView: NSView {
    
    var circleLayer: CALayer!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        wantsLayer = true
        
        circleLayer = CALayer()
        let dimension = floor(min(bounds.width, bounds.height) - 4)
        circleLayer.frame = NSMakeRect(2, 2, dimension, dimension)
        circleLayer.cornerRadius = dimension / 2
        circleLayer.backgroundColor = NSColor.redColor().CGColor
        circleLayer.masksToBounds = false
        circleLayer.hidden = true
        layer?.addSublayer(circleLayer)
    }
    
    override func prepareForInterfaceBuilder() {
        layer?.backgroundColor = NSColor.darkGrayColor().CGColor
        circleLayer.hidden = false
    }
    
}
