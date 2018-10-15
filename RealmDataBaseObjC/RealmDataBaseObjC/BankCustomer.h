//
//  BankCustomer.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 18/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Realm/Realm.h>
@interface BankCustomer : RLMObject
@property NSString *borrower;
@property NSString *countryshortname;
@property NSString *project_abstract;
@property NSString *imageURL;
@property NSString *project_name;
@property NSString *url;
@end
// This protocol enables typed collections. i.e.:
// RLMArray<BankCustomer>
RLM_ARRAY_TYPE(BankCustomer)
