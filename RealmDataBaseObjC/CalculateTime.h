//
//  CalculateTime.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 01/07/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateTime : NSObject
- (void)StartTime;
- (void)EndTime;
- (double)CalculateTimeElapsed;
+ (CalculateTime *)sharedInstance;
@end
