//
//  RootViewController.h
//  COIN
//
//  Created by Adam Wilson on 9/09/10.
//  Copyright Adam P. Wilson 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@class DetailViewController;
@class EventTableViewCell;

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
    
    DetailViewController *detailViewController;
    
	NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *managedObjectContext;
	
	EventTableViewCell *eventTableViewCell;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, assign) IBOutlet EventTableViewCell *eventTableViewCell;

//@property (nonatomic, getter=isHighlighted) BOOL highlighted;
//@property (nonatomic, getter=isEditing) BOOL editing;

- (void)updateRowTags;
- (IBAction)insertNewObject:(id)sender;

@end
