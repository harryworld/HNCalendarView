//
//  HNCalendarView.swift
//  HNCalendarView
//
//  Created by Harry Ng on 5/4/2016.
//  Copyright © 2016 STAY REAL LIMITED. All rights reserved.
//

import Cocoa
import SwiftDate

public class HNCalendarView: NSViewController {
    
    // Today
    let date = NSDate()
    // Selected Date
    public var selectedDate: NSDate = NSDate() {
        didSet {
            selectSelectedDateItem()
        }
    }
    
    public var counts: [Int]?
    
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
    
    private func selectSelectedDateItem() {
        if let selectedIndexPath = indexPathForDate(selectedDate) {
            collectionView?.selectItemsAtIndexPaths([selectedIndexPath], scrollPosition: .None)
        }
    }
    
    func indexPathForDate(selectedDate: NSDate) -> NSIndexPath? {
        
        if date.month == selectedDate.month {
            let item = date.startOf(.Month).weekday + selectedDate.day - 2
            return NSIndexPath(forItem: item, inSection: Section.Date.rawValue)
        }
        return nil
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
        
        var item: NSCollectionViewItem
        
        switch Section(rawValue: indexPath.section)! {
        case .Month:
            item = collectionView.makeItemWithIdentifier("HNMonthItem", forIndexPath: indexPath)
            
            if let item = item as? HNMonthItem {
                item.configure(HNCalendar.Month[date.month - 1], year: date.year)
            }
        case .Week:
            item = collectionView.makeItemWithIdentifier("HNWeekItem", forIndexPath: indexPath)
            
            if let item = item as? HNWeekItem {
                item.configure(HNCalendar.Week[indexPath.item])
            }
        case .Date:
            
            let (day, inMonth) = dayInMonthForItem(indexPath.item)
            
            item = collectionView.makeItemWithIdentifier("HNDateItem", forIndexPath: indexPath)
            
            if let item = item as? HNDateItem {
                item.configure(day, inCurrentMonth: inMonth)
                
                if let counts = counts where inMonth {
                    item.count = counts[day - 1]
                } else {
                    item.count = 0
                }
            }
        }
        
        return item
    }
    
    // MARK: - Private
    
    private func dayInMonthForItem(item: Int) -> (Int, Bool) {
        
        var day: Int
        var inMonth = false
        
        if item < date.startOf(.Month).weekday - 1 {
            day = dayForItem(item) + 1.months.fromDate(date).monthDays
        } else if item - date.startOf(.Month).weekday < date.monthDays - 1 {
            day = dayForItem(item)
            inMonth = true
        } else {
            day = dayForItem(item) - date.monthDays
        }
        
        return (day, inMonth)
    }
    
    private func dayForItem(item: Int) -> Int {
        return item - date.startOf(.Month).weekday + 2
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
