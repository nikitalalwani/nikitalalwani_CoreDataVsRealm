//
//  CDSectors.m
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMSectors.h"

@implementation RMSectors

+ (NSString *)primaryKey {
    return @"code";
}

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{
    
    NSDictionary *data = @{@"code":[item objectForKey:@"code"], @"name":[item objectForKey:@"name"]};
    return [RMSectors createOrUpdateInDefaultRealmWithValue:data];
}


@end
