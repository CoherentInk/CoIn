//
//  FOSAnnotation.m
//  COIN
//
//  Created by Adam Wilson on 9/09/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import "FOSAnnotation.h"


@implementation FOSAnnotation

@synthesize image, title, subtitle, latitude, longitude, locator;

- (CLLocationCoordinate2D)coordinate;
{
	CLLocationCoordinate2D theCoordinate;
	theCoordinate.latitude = [latitude doubleValue];
	theCoordinate.longitude = [longitude doubleValue];
	return theCoordinate;
}

- (void)dealloc {
	[image release];
	[title release];
	[subtitle release];
	[latitude release];
	[longitude release];
	[super dealloc];
}

@end
