//
//  ProjectDocs.h
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>
#import "RMDocType.h"

@interface RMProjectDocs : RLMObject

@property (nonatomic, strong) NSDate *docDate;
@property (nonatomic, strong) NSString *urlPath;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) RMDocType *docType;

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item;
@end

RLM_ARRAY_TYPE(RMProjectDocs) // Defines an RLMArray<RMDocType> type