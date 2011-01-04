//
//  FOSAnnotation.h
//  COIN
//
//  Created by Adam Wilson on 9/09/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Locator;

@interface FOSAnnotation : NSObject <MKAnnotation> {
	UIImage *image;
	NSString *title;
	NSString *subtitle;
	NSNumber *latitude;
	NSNumber *longitude;
	
	Locator *locator;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;

@property (nonatomic, retain) Locator *locator;

@end
