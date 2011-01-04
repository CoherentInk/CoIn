//
//  Simulation.h
//  COIN
//
//  Created by Adam Wilson on 17/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class Locator, Population;

@interface Simulation :  NSManagedObject  
{
	BOOL running;
}

@property (nonatomic, retain) NSDate *date;
@property (nonatomic) MKMapType *mapType;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSNumber *latitudeDelta;
@property (nonatomic, retain) NSNumber *longitudeDelta;
@property (nonatomic, retain) NSSet *locators;
@property (nonatomic, retain) NSSet *populations;
@property (nonatomic) BOOL running;

@end



