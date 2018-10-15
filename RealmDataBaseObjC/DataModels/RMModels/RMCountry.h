//
//  RMCountry.h
//  DB_OverView
//
//  Created by Globallogic on 07/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>
#import "RMProject.h"

@interface RMCountry : RLMObject

@property  NSString *code;

@property  NSString *displayName;
@property(nonatomic, strong) RLMArray<RMProject*> <RMProject> *allProjects;
@property  NSString *countryName;

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item;
-(id)insertOrUpdateItemWith:(NSDictionary*)data;

@end
