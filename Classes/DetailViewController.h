//
//  DetailViewController.h
//  COIN
//
//  Created by Adam Wilson on 9/09/10.
//  Copyright Adam P. Wilson 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class RootViewController, Locator, Simulation;

@interface DetailViewController : UIViewController <MKMapViewDelegate, UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
    UIPopoverController *popoverController;
    UIToolbar *toolbar;
	MKMapView *mapView;
    
    NSManagedObject *detailItem;
    UILabel *detailDescriptionLabel;

    RootViewController *rootViewController;
	NSMutableArray *mapAnnotations;
	
	UILabel *gameTime;
	Simulation *simulation;
	NSTimer *dateTimer;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) NSManagedObject *detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;

@property (nonatomic, retain) IBOutlet UILabel *gameTime;
@property (nonatomic, retain) Simulation *simulation;
@property (assign) NSTimer *dateTimer;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;
+ (MKCoordinateRegion)countryRegion;

- (void)animateToLocator:(Locator *)location;
- (void)animateToCountry:(Locator *)location;
- (void)animateToRegion:(Locator *)location;
- (IBAction)viewPlacesList:(id)sender;
- (IBAction)setMapType:(id)sender;

- (void)updateDate:(NSTimer *)timer;
- (NSDictionary *)userInfo;

@end
