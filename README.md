# HNCalendarView
CalendarView framework written in Swift for OS X

# Usage

## Initialize the Calendar View

```
let calendarView = HNCalendarView()
```

## Overriding Preferences

```
var preferences = HNCalendarView.Preferences()
preferences.calendar.backgroundColor = NSColor.grayColor()
preferences.calendar.textColor = NSColor.whiteColor()

preferences.date.circleBackgroundColor = NSColor.yellowColor()
preferences.date.dotColor = NSColor.greenColor()

HNCalendarView.globalPreferences = preferences
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
