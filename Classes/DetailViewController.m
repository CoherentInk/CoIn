//
//  DetailViewController.m
//  COIN
//
//  Created by Adam Wilson on 9/09/10.
//  Copyright Adam P. Wilson 2010. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
#import "Locator.h"
#import "Simulation.h"


@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end


@implementation DetailViewController

@synthesize toolbar, mapView, popoverController, detailItem, detailDescriptionLabel, rootViewController, mapAnnotations, gameTime, simulation, dateTimer;


#pragma mark -

+ (CGFloat)annotationPadding;
{
	return 10.0f;
}
+ (CGFloat)calloutHeight;
{
	return 40.0f;
}
+ (MKCoordinateRegion)countryRegion;
{
    MKCoordinateRegion theRegion;
    theRegion.center.latitude = 34.325;
    theRegion.center.longitude = 67.495;
    theRegion.span.latitudeDelta = 6;
    theRegion.span.longitudeDelta = 8.5;
	return theRegion;
}

#pragma mark -
#pragma mark Map controls

- (IBAction)viewPlacesList:(id)sender {
	
	[mapView setRegion:[DetailViewController countryRegion] animated:YES];
	// show the list of bookmarks in a popover
	// hide the other popover if necessary
}

- (void)animateToLocator:(Locator *)location {
	[mapView deselectAnnotation:[mapView.selectedAnnotations objectAtIndex:0] animated:YES];
	MKCoordinateRegion current = mapView.region;
	if ( (fabs(current.center.latitude - [location.latitude doubleValue]) > current.span.latitudeDelta) && (fabs(current.center.longitude - [location.longitude doubleValue]) > current.span.longitudeDelta) ) {
		[self performSelector:@selector(animateToCountry:) withObject:location afterDelay:0.3];
		[self performSelector:@selector(animateToRegion:) withObject:location afterDelay:1.3];
		[mapView performSelector:@selector(selectAnnotation:animated:) withObject:location afterDelay:2.5];
	} else {
		[self performSelector:@selector(animateToRegion:) withObject:location afterDelay:0.3];
		[mapView performSelector:@selector(selectAnnotation:animated:) withObject:location afterDelay:1.3];
	}
}

- (void)animateToCountry:(Locator *)location {
	MKCoordinateRegion current = mapView.region;
	MKCoordinateRegion midpoint = { { (current.center.latitude + location.coordinate.latitude)/2.0 , (current.center.longitude + location.coordinate.longitude)/2.0},
		{fabs(current.center.latitude - [location.latitude doubleValue]), fabs(current.center.longitude - [location.longitude doubleValue])} };
	[mapView setRegion:midpoint animated:YES];
}

- (void)animateToRegion:(Locator *)location {
	MKCoordinateRegion region = { location.coordinate, {0.4, 0.4} };
	MKCoordinateRegion current = mapView.region;
	if (current.span.latitudeDelta < region.span.latitudeDelta
		&& current.span.longitudeDelta < region.span.longitudeDelta
		&& fabs(current.center.latitude - [location.latitude doubleValue]) <= current.span.latitudeDelta * 2
		&& fabs(current.center.longitude - [location.longitude doubleValue]) <= current.span.longitudeDelta * 2)
	{
		region.span.latitudeDelta = current.span.latitudeDelta;
		region.span.longitudeDelta = current.span.longitudeDelta;
	}
	[mapView setRegion:region animated:YES];
}

- (IBAction)setMapType:(id)sender {
	switch (((UISegmentedControl *)sender).selectedSegmentIndex)
	{
		case 0:
		{
			mapView.mapType = MKMapTypeStandard;
			break;
		}
		case 1:
		{
			mapView.mapType = MKMapTypeSatellite;
			break;
		}
		default:
		{
			mapView.mapType = MKMapTypeHybrid;
			break;
		}
	}
}


#pragma mark -
#pragma mark MKMapViewDelegate

- (void)showDetails:(id)sender {
	// show the details of the annotation
	// animate to a larger popover/area with info
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
	// if it's the user's location, just return nil
	if ([annotation isKindOfClass:[MKUserLocation class]])
		return nil;
	
	if ([annotation isKindOfClass:[Locator class]]) {
		switch ([[(Locator *)annotation kind] intValue]) {
			case 0: { // Event ==> red
				static NSString* pinAnnotationIdentifier = @"Event";
				MKPinAnnotationView* pinView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:pinAnnotationIdentifier];
				if (!pinView) {
					pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinAnnotationIdentifier] autorelease];
					pinView.pinColor = MKPinAnnotationColorRed;
					pinView.animatesDrop = YES;
					pinView.canShowCallout = YES;
					UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
					[rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
					pinView.rightCalloutAccessoryView = rightButton;
				} else {
					pinView.annotation = annotation;
				}
				return pinView;
				break;
			}
			case 1: { // Intel ==> purple
				static NSString* pinAnnotationIdentifier = @"Intel";
				MKPinAnnotationView* pinView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:pinAnnotationIdentifier];
				if (!pinView) {
					pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinAnnotationIdentifier] autorelease];
					pinView.pinColor = MKPinAnnotationColorPurple;
					pinView.animatesDrop = YES;
					pinView.canShowCallout = YES;
					UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
					[rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
					pinView.rightCalloutAccessoryView = rightButton;
				} else {
					pinView.annotation = annotation;
				}
				return pinView;
				break;
			}
			case 2: { // Forces on Station ==> green
				static NSString* pinAnnotationIdentifier = @"FOS";
				MKPinAnnotationView* pinView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:pinAnnotationIdentifier];
				if (!pinView) {
					pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinAnnotationIdentifier] autorelease];
					pinView.pinColor = MKPinAnnotationColorGreen;
					pinView.animatesDrop = YES;
					pinView.canShowCallout = YES;
					pinView.draggable = YES;
					UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
					[rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
					pinView.rightCalloutAccessoryView = rightButton;
				} else {
					pinView.annotation = annotation;
				}
				return pinView;
				break;
			}
		}
	}
	return nil;
}


#pragma mark -
#pragma mark Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(NSManagedObject *)managedObject {
    
	if (detailItem != managedObject) {
		[detailItem release];
		detailItem = [managedObject retain];
		
        // Update the view.
        [self configureView];
	}
    
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }		
}


- (void)configureView {
    // Update the user interface for the detail item.
    detailDescriptionLabel.text = [[detailItem valueForKey:@"timeStamp"] description];
}


#pragma mark -
#pragma mark Date/time timer

- (NSDictionary *)userInfo {
	return [NSDictionary dictionaryWithObject:[NSDate date] forKey:@"StartDate"];
}

- (void)updateDate:(NSTimer *)timer {
	// A date formatter for the game datetime.
    static NSDateFormatter *dateFormatter = nil;
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm '(GMT+4:30)'"];
	}
	
	simulation.date = [simulation.date dateByAddingTimeInterval:60.0f];
	gameTime.text = [dateFormatter stringFromDate:[simulation date]];
}

- (void)stopDateTimer:sender {
    [dateTimer invalidate];
    self.dateTimer = nil;
}


#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
    barButtonItem.title = @"Intel";
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
}


#pragma mark -
#pragma mark View lifecycle


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.mapView.mapType = MKMapTypeHybrid;
	
	self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:0];
		
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [rootViewController.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Simulation" inManagedObjectContext:context];
	
	// TODO: Load simulation from store, populate fields
	simulation = [[Simulation alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
	simulation.date = [[NSDate alloc] init];
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(updateDate:)
								   userInfo:[self userInfo]
									repeats:YES];
	self.dateTimer = timer;
	
	// start off by default in Afghanistan
    [self.mapView setRegion:[DetailViewController countryRegion] animated:YES];
	
    [super viewDidLoad];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
	
	// show annotation pins
	[self.mapView removeAnnotations:self.mapView.annotations];
	for (int i = 0; i < [self.mapAnnotations count]; i++) {
		[self.mapView addAnnotation:[self.mapAnnotations objectAtIndex:i]];
	}
	[super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
	self.mapView = nil;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	
    [popoverController release];
    [toolbar release];
	[mapView release];
	
	[detailItem release];
	[detailDescriptionLabel release];
	
	[mapAnnotations release];
	[gameTime release];
	[simulation release];
	[dateTimer release];
    
	[super dealloc];
}	


@end
