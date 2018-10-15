//
//  RMDocType.m
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMDocType.h"

@implementation RMDocType

+ (NSString *)primaryKey {
    return @"code";
}


+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{
    
    NSDictionary *data = @{@"code":[item objectForKey:@"DocType"], @"type":[item objectForKey:@"DocType"],@"typeDescription":[item objectForKey:@"DocTypeDesc"]};
    return [RMDocType createOrUpdateInDefaultRealmWithValue:data];
}
@end
