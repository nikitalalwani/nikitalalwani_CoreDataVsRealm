//
//  CDSectors.h
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>

@interface RMSectors : RLMObject

@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *name;


+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item;
@end

RLM_ARRAY_TYPE(RMSectors)