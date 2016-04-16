# HNCalendarView
CalendarView framework written in Swift for OS X

# Usage

## Initialize the Calendar View

```
let calendarView = HNCalendarView()
```

## Add Calendar to the view hierarchy

```
addChildViewController(calendarView)
calendarView.view.frame = containerView.frame
view.addSubview(calendarView.view)
```

## Set the calendar properties

```
calendarView.counts = generateCounts()
calendarView.selectedDate = NSDate()
```
