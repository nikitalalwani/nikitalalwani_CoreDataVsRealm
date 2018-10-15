//
//  ProjectDocs.m
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMProjectDocs.h"

@implementation RMProjectDocs


+ (NSString *)primaryKey {
    return @"code";
}

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{
    
    NSDictionary *data = @{@"code":[item objectForKey:@"EntityID"], @"urlPath":[item objectForKey:@"DocURL"], @"docDate":[NSDate new]};
    return [RMProjectDocs createOrUpdateInDefaultRealmWithValue:data];
}
@end
