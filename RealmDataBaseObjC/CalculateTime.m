//
//  CalculateTime.m
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 01/07/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "CalculateTime.h"
#include <mach/mach_time.h>
#include <stdint.h>

@interface CalculateTime ()
@property(nonatomic)uint64_t startTime;
@property(nonatomic)uint64_t endTime;

@end

@implementation CalculateTime

+ (CalculateTime *)sharedInstance
{
    static CalculateTime *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CalculateTime alloc] init];
    });
    return sharedInstance;
}

- (void)StartTime
{
    
    self.startTime = mach_absolute_time();
    
}

- (void)EndTime
{
    
    self.endTime = mach_absolute_time();
    
}

- (double)CalculateTimeElapsed
{
    uint64_t elapsedMTU = self.endTime - self.startTime;
    
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info))
    {
        NSLog(@"Getting Error");
    }
    // Get elapsed time in nanoseconds:
    double elapsedTime = (double)elapsedMTU * (double)info.numer / (double)info.denom;
   double milliseconds = elapsedTime/1000000;
    double seconds = milliseconds/1000;
    return seconds;
}

@end
