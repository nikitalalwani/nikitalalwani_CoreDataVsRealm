//
//  RMBorrower.h
//  DB_OverView
//
//  Created by Globallogic on 07/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>
//#import "RMCountry.h"
@class RMCountry;

@interface RMBorrower : RLMObject

@property(nonatomic, strong) NSString *bName;
@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) RMCountry *fromCountry;

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item;

@end
