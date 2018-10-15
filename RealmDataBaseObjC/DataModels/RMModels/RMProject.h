//
//  RMProject.h
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>
#import "RMBorrower.h"
#import "RMProjectDocs.h"
#import "RMSectors.h"

@interface RMProject : RLMObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *lendinginstr;
@property(nonatomic, strong) NSString *envassesmentcategorycode;
@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *boardApprovedMonth; // TODO: Make it ignored property
@property(nonatomic, strong) NSString *verify;
@property(nonatomic, strong) NSDate   *boardApprovedDate;
@property(nonatomic, strong) NSNumber<RLMInt> *grantAmmount;
@property(nonatomic, strong) NSNumber<RLMInt> *ibrdAmmount;
@property(nonatomic, strong) NSNumber<RLMInt> *totalammount;
@property(nonatomic, strong) RMBorrower *borrower;
@property(nonatomic, strong) RLMArray<RMProjectDocs*> <RMProjectDocs> *allDocs;
@property(nonatomic, strong) RLMArray<RMSectors*> <RMSectors> *allSectors;



+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item withIndex:(NSInteger)index;
@end

RLM_ARRAY_TYPE(RMProject)
