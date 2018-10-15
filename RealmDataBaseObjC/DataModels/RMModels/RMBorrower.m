//
//  RMBorrower.m
//  DB_OverView
//
//  Created by Globallogic on 07/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMBorrower.h"
#import "RMCountry.h"

@implementation RMBorrower


+ (NSString *)primaryKey {
    return @"code";
}



+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{

    NSDictionary *data = @{@"code":[item objectForKey:@"borrower"], @"bName":[item objectForKey:@"borrower"]};
    return [RMBorrower createOrUpdateInDefaultRealmWithValue:data];
}

-(id)insertOrUpdateItemWith:(NSDictionary*)data{

    self.code = [data objectForKey:@"borrower"]; // name itself id key here
    self.bName = [data objectForKey:@"borrower"];
    return self;
}

@end
