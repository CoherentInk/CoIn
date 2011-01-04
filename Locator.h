//
//  Locator.h
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
#import "DetailViewController.h"

@class ForceType;

@interface Locator : NSManagedObject <MKAnnotation> {
}

@property (nonatomic, retain) Simulation *simulation;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSNumber *kind;
@property (nonatomic, retain) NSDate *timeStamp;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;

@property (nonatomic, retain) NSNumber *costToComplete;
@property (nonatomic, retain) NSNumber *timeToComplete;

@property (nonatomic, retain) NSString *source;

@property (nonatomic) BOOL hasVision;

@property (nonatomic, retain) NSSet *forceTypes;

+ (void)setDetailViewController:(DetailViewController *)dvc;
- (void)addAnnotation;

@end
