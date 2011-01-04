//
//  RulesOfEngagement.h
//  COIN
//
//  Created by Adam Wilson on 11/10/10.
//  Copyright 2010 Adam P. Wilson. All rights reserved.
//

#import <CoreData/CoreData.h>

@class ForceType;

@interface RulesOfEngagement : NSManagedObject {
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic) BOOL fireWarningShots;
@property (nonatomic) BOOL mustBeEngaged;
@property (nonatomic) BOOL mustConfirmFoe;
@property (nonatomic) BOOL mustHaveApproval;
@property (nonatomic) BOOL minimizeCivilianCasualties;

@property (nonatomic, retain) NSSet *forceTypes;

@end
