

# Location Trivia — Views

## Instructions

  1. Finished versions of the `FISTrivium` and `FISLocation` classes are provided from the previous labs. Remember that there are several `FISLocation`s, and each `FISLocation` instance has several `FISTrivium` instances relevant to it.
  2. The goal is to display a table of an `NSArray` of `FISLocation`s. Create a new `UITableViewController` named `FISLocationsTableViewController`.
    * In `viewDidLoad` set the `accessibilityLabel` and `accessibilityIdentifier` to `Locations Table`
    * Create an `NSArray` property called `locations`. This will hold all of the `FISLocation` objects.
  3. Make each cell a `right detail` cell. This enables two different `UILabel` views that can display different pieces of information. The primary one on the left is the `textLabel` and the secondary label on the right is called the `detailTextLabel`.
  4. For each cell, set the `textLabel` to the name of the location and the `detailTextLabel` to the number of trivia items for that location.
  5. When a cell is tapped, it should take the user to another `UITableViewController` called `FISTriviaTableViewController`. This should display all of the trivia for that location in the `textLabel` of each cell.
    * In `viewDidLoad` set the `accessibilityLabel` and `accessibilityIdentifier` to `Trivia Table`


## Extra Credit

Make multiple sections. Each section should represent a `FISLocation` with the section's header being the name property and each cell in it to be the different `FISTrivium` objects relevant to that location.  
**Note:** *This is hard* Allow for the reordering of Locations in your table... [helpful link](https://developer.apple.com/library/ios/documentation/userexperience/conceptual/tableview_iphone/ManageReorderRow/ManageReorderRow.html)

<a href='https://learn.co/lessons/locationTrivia-TableViews' data-visibility='hidden'>View this lesson on Learn.co</a>
