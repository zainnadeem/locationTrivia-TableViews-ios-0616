---
tags: tableviews, arrays, UINavigationController
language: objc
---

# LocationTrivia Views

## Instructions

  1. I included a finished version of `FISTrivia` and `FISLocation`. Pretty much there are `FISLocations`, and each `FISLocation` has multiple `FISTrivia`s about that location.
  2. The goal is to display a table of an `NSArray` of `FISLocations`. So create a new `UITableViewController` named `FISLocationsTableViewController`.
    * In `viewDidLoad` set the `accessibilityLabel` and `accessibilityIdentifier` to `Locations Table`
    * Create an `NSArray` property called `locations`. This will house all of your `FISLocation` objects.
  3. Make each cell a `right detail` cell. This enables two different `UILabel` views where you can put stuff in. The basic one is `textLabel` and the label on the right is called `detailTextLabel`.
  4. For each cell, set the `textLabel` to the name of the location and the `detailTextLabel` to the number of trivia items for that location.
  5. When you tap on a cell it should take you to another `UITableViewController` called `FISTriviaTableViewController`. This should display all of the trivia for that location in the `textLabel` of each cell.
    * In `viewDidLoad` set the `accessibilityLabel` and `accessibilityIdentifier` to `Trivia Table`


## Extra Credit

  * Make multiple sections. Each section should represent an `FISLocation` with the header being the name property and each cell in it to be the different `FISTrivia` objects.
  * **this is hard** Allow for the reordering of Locations in your table.. [Some help](https://developer.apple.com/library/ios/documentation/userexperience/conceptual/tableview_iphone/ManageReorderRow/ManageReorderRow.html)
