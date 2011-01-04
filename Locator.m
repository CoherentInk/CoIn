//
//  Locator.m
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import "Locator.h"
#import "ForceType.h"

@implementation Locator

@dynamic simulation, title, summary, latitude, longitude, kind, timeStamp, costToComplete, timeToComplete, source, hasVision, forceTypes;
	static DetailViewController *detailViewController = nil;

+ (void)setDetailViewController:(DetailViewController *)dvc {
	detailViewController = dvc;
}

- (CLLocationCoordinate2D)coordinate;
{
	CLLocationCoordinate2D theCoordinate;
	theCoordinate.latitude = [self.latitude doubleValue];
	theCoordinate.longitude = [self.longitude doubleValue];
	return theCoordinate;
}

- (NSString *)subtitle {
	return self.summary;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
	// requires iOS 4 or later to work
	self.latitude = [NSNumber numberWithDouble:newCoordinate.latitude];
	self.longitude = [NSNumber numberWithDouble:newCoordinate.longitude];
}

- (void)awakeFromInsert {
	[super awakeFromInsert];
	[self addAnnotation];
}

- (void)awakeFromFetch {
	[super awakeFromFetch];
	[self addAnnotation];
}

- (void)addAnnotation {
	// recreate the corresponding annotation if it doesn't already exist
	if (![detailViewController.mapAnnotations containsObject:self]) {
		[detailViewController.mapAnnotations addObject:self];
		[detailViewController.mapView addAnnotation:self];
	}
}

- (void)didTurnIntoFault {
	// remove the annotation from the map view
	[detailViewController.mapView removeAnnotation:self];
	[detailViewController.mapAnnotations removeObject:self];
	
	[super didTurnIntoFault];
}


@end
