//
//  World_Bank+CoreDataProperties.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 19/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "World_Bank.h"

NS_ASSUME_NONNULL_BEGIN

@interface World_Bank (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *borrower;
@property (nullable, nonatomic, retain) NSString *countryshortname;
@property (nullable, nonatomic, retain) NSString *imageURL;
@property (nullable, nonatomic, retain) NSString *project_abstract;
@property (nullable, nonatomic, retain) NSString *project_name;
@property (nullable, nonatomic, retain) NSString *url;

@end

NS_ASSUME_NONNULL_END