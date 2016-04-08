//
//  HNCalendarView.swift
//  HNCalendarView
//
//  Created by Harry Ng on 5/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa

public class HNCalendarView: NSViewController {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    enum Section: Int {
        case Month = 0, Week, Date
    }
    
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

extension HNCalendarView: NSCollectionViewDataSource {
    
    public func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return 3
    }
    
    public func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch Section(rawValue: section)! {
        case .Month:
            return 1
        case .Week:
            return 7
        case .Date:
            return 7 * 6
        }
    }
    
    public func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        
        switch Section(rawValue: indexPath.section)! {
        case .Month:
            return collectionView.makeItemWithIdentifier("HNMonthItem", forIndexPath: indexPath)
        case .Week:
            return collectionView.makeItemWithIdentifier("HNWeekItem", forIndexPath: indexPath)
        case .Date:
            return collectionView.makeItemWithIdentifier("HNDateItem", forIndexPath: indexPath)
        }
    }
    
}

extension HNCalendarView: NSCollectionViewDelegate {
    
}

extension HNCalendarView: NSCollectionViewDelegateFlowLayout {
    
    public func collectionView(collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> NSSize {
        
        let width = collectionView.bounds.width
        
        switch Section(rawValue: indexPath.section)! {
        case .Month:
            return NSMakeSize(width, 50)
        case .Week:
            return NSMakeSize(width / 7, 30)
        case .Date:
            return NSMakeSize(width / 7, 40)
        }

    }
    
}
