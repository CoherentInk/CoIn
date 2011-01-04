//
//  Distribution.h
//  COIN
//
//  Created by Adam Wilson on 15/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Population;

@interface Distribution :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * p75_79;
@property (nonatomic, retain) NSNumber * q80_84;
@property (nonatomic, retain) NSNumber * j45_49;
@property (nonatomic, retain) NSNumber * k50_54;
@property (nonatomic, retain) NSNumber * d15_19;
@property (nonatomic, retain) NSNumber * b5_9;
@property (nonatomic, retain) NSNumber * r85_89;
@property (nonatomic, retain) NSNumber * s90_94;
@property (nonatomic, retain) NSNumber * e20_24;
@property (nonatomic, retain) NSNumber * l55_59;
@property (nonatomic, retain) NSNumber * m60_64;
@property (nonatomic, retain) NSNumber * a0_4;
@property (nonatomic, retain) NSNumber * f25_29;
@property (nonatomic, retain) NSNumber * g30_34;
@property (nonatomic, retain) NSNumber * t95_99;
@property (nonatomic, retain) NSNumber * o70_74;
@property (nonatomic, retain) NSNumber * n65_69;
@property (nonatomic, retain) NSNumber * h35_39;
@property (nonatomic, retain) NSNumber * i40_44;
@property (nonatomic, retain) NSNumber * c10_14;
@property (nonatomic, retain) Population * population;

@end



