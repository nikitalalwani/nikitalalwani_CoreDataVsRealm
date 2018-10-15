//
//  Person.m
//  DB_OverView
//
//  Created by Globallogic on 09/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "Person.h"

@implementation Person


+ (NSString *)primaryKey {
    return @"personID";
}

+ (NSArray *)requiredProperties {
    return @[@"name"];
}

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{
    
    NSDictionary *data = @{@"personID":[item objectForKey:@"personID"], @"birthday":[item objectForKey:@"birthday"], @"name":[item objectForKey:@"name"]};
    return [Person createOrUpdateInDefaultRealmWithValue:data];
    
}

@end
