//
//  Population.h
//  COIN
//
//  Created by Adam Wilson on 15/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Distribution, Simulation;

@interface Population :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDecimalNumber *size; // 29,121,286 in 2010, 2.576% growth (38.37/1000 population), 17.83/1000 population deaths, 5.22/1000 net migration
@property (nonatomic, retain) NSDecimalNumber *insurgents; // 93,000
@property (nonatomic, retain) Distribution *wealth; // 36% below poverty line, GDP: $14.483B
@property (nonatomic, retain) Distribution *health; // 32 preventable deaths per hour, 80,000 without limbs from landmines, 257 deaths per 1,000 live births, 0-14: 43.6% 15-64: 54% 65+: 2.4%
@property (nonatomic, retain) Distribution *employment; // 35% unemployment, 42% less than $1 a day
@property (nonatomic, retain) Distribution *education; // 28.1% can read and write (over age 15), 8 years school average

@property (nonatomic, retain) Simulation *simulation;

@end



