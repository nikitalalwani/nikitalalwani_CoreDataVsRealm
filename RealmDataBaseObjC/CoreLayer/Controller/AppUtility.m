//
//  AppUtility.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 06/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "AppUtility.h"

@implementation AppUtility

+(NSDate *)getDateFromString:(NSString*)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDate *date = [dateFormatter dateFromString: dateString];
    if(date == nil)
    {
        return  [NSDate new];
    }
    return date;
}
@end
