//
//  ForceType.h
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Locator;
@class RulesOfEngagement;

@interface ForceType : NSManagedObject {
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic) BOOL canMove;
@property (nonatomic) BOOL canDrive;
@property (nonatomic) BOOL canFly;
@property (nonatomic) BOOL isHuman;

@property (nonatomic, retain) NSSet *locators;
@property (nonatomic, retain) RulesOfEngagement *roe;

@end
