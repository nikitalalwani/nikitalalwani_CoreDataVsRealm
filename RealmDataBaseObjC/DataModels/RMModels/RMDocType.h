//
//  RMDocType.h
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>

@interface RMDocType : RLMObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *typeDescription;

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item;



@end
