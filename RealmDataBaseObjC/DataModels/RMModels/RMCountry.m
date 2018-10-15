//
//  RMCountry.m
//  DB_OverView
//
//  Created by Globallogic on 07/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMCountry.h"
#import "DataConstants.h"

@implementation RMCountry


+ (NSString *)primaryKey {
    return @"code";
}

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item{
    
    NSDictionary *data = @{CODE_KEY:[item objectForKey:COUNTRY_CODE], @"countryName":[item objectForKey:@"countryname"], @"displayName":[item objectForKey:@"countryshortname"]};
    return [RMCountry createOrUpdateInDefaultRealmWithValue:data];
}

-(id)insertOrUpdateItemWith:(NSDictionary*)data{
    
    
    self.code = [data objectForKey:@"countrycode"];
    self.countryName = [data objectForKey:@"countryname"];
    self.displayName = [data objectForKey:@"countryshortname"];
    return self;
}
@end
