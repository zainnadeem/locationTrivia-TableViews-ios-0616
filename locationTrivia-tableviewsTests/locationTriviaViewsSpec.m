//
//  locationTriviaViewsSpec.m
//  locationTrivia-tableviews
//
//  Created by Joe Burgess on 6/20/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "FISLocation.h"
#import "FISTrivium.h"
#import "FISLocationsTableViewController.h"
#import "FISAppDelegate.h"

SpecBegin(locationTriviaViews)

describe(@"locationTriviaViews", ^{
    
    beforeAll(^{

        // Get the current instance of FISLocationsTableViewContoller showing
        FISAppDelegate *myDelegate = (FISAppDelegate *)[UIApplication sharedApplication].delegate;
        UINavigationController *navVC =(UINavigationController *)myDelegate.window.rootViewController;
        FISLocationsTableViewController *locationVC = (FISLocationsTableViewController *)navVC.visibleViewController;

        //Wait for the Table to show up
        [tester waitForViewWithAccessibilityLabel:@"Locations Table"];

        // Set up some test data
        FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                          latitude:40.7484
                                                         longitude:-73.9857];

        FISTrivium *trivia1A = [[FISTrivium alloc] initWithContent:@"1,454 Feet Tall" likes:4];
        FISTrivium *trivia1B = [[FISTrivium alloc] initWithContent:@"Cost $24,718,000 to build" likes:2];

        [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];

        FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                          latitude:41.3739
                                                         longitude:-83.6508];

        FISTrivium *trivia2A = [[FISTrivium alloc] initWithContent:@"NYC's oldest park" likes:8];
        FISTrivium *trivia2B = [[FISTrivium alloc] initWithContent:@"Made a park in 1733" likes:2];
        FISTrivium *trivia2C = [[FISTrivium alloc] initWithContent:@"Charging Bull was created in 1989" likes:0];


        [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];

        FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                          latitude:40.6892
                                                         longitude:74.0444];
        FISTrivium *trivia3A = [[FISTrivium alloc] initWithContent:@"Gift from the french" likes:6];
        
        [location3.trivia addObjectsFromArray:@[trivia3A]];


        // Add them to the locations property on FISLocationsTableViewController
        locationVC.locations = @[location1,location2,location3];

        // reload the displayed data
        [locationVC.tableView reloadData];
    });
    
    describe(@"Locations Table View", ^{
        __block UITableView *table;
        
        beforeEach(^{
            table = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"Locations Table"];
        });
        
        it(@"should display three cells", ^{
            expect([table numberOfRowsInSection:0]).to.equal(3);
        });
        
        it(@"should display the name in the textLabel", ^{
            NSIndexPath *row = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.textLabel.text).to.equal(@"The Empire State Building");
            
            row = [NSIndexPath indexPathForRow:1 inSection:0];
            cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.textLabel.text).to.equal(@"Bowling Green");
            
            row = [NSIndexPath indexPathForRow:2 inSection:0];
            cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.textLabel.text).to.equal(@"Statue Of Liberty");
        });
        
        it(@"should display the number of trivia in the detailTextLabel", ^{
            NSIndexPath *row = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.detailTextLabel.text).to.equal(@"2");
            
            row = [NSIndexPath indexPathForRow:1 inSection:0];
            cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.detailTextLabel.text).to.equal(@"3");
            
            row = [NSIndexPath indexPathForRow:2 inSection:0];
            cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            
            expect(cell.detailTextLabel.text).to.equal(@"1");
        });
        
        it(@"Should push on trivia VC when a cell is tapped", ^{
            NSIndexPath *row = [NSIndexPath indexPathForRow:0 inSection:0];
            [tester tapRowAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            [tester waitForViewWithAccessibilityLabel:@"Trivia Table"];
            [tester tapViewWithAccessibilityLabel:@"Back"];
        });
        
    });
    
    describe(@"Trivia ViewController", ^{
        __block UITableView *table;
        beforeEach(^{
            NSIndexPath *row = [NSIndexPath indexPathForRow:0 inSection:0];
            [tester tapRowAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Locations Table"];
            table = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"Trivia Table"];
        });
        
        it(@"Should display 2 trivia", ^{
            expect([table numberOfRowsInSection:0]).to.equal(2);
        });
        
        it(@"Should display the trivia content in each textLabel", ^{
            NSIndexPath *row = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Trivia Table"];
            
            expect(cell.textLabel.text).to.equal(@"1,454 Feet Tall");
            
            row = [NSIndexPath indexPathForRow:1 inSection:0];
            cell = (UITableViewCell *)[tester waitForCellAtIndexPath:row inTableViewWithAccessibilityIdentifier:@"Trivia Table"];
            
            expect(cell.textLabel.text).to.equal(@"Cost $24,718,000 to build");
        });
        
        afterEach(^{
            [tester tapViewWithAccessibilityLabel:@"Back"];
        });
    });
    
});

SpecEnd
