//
//  CDCountry.h
//  
//
//  Created by Globallogic on 05/06/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataConstants.h"

@class CDProject,CDBorrower,CDAgency;

NS_ASSUME_NONNULL_BEGIN

@interface CDCountry : NSManagedObject


@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *countryName;
@property (nullable, nonatomic, retain) NSString *displayName;
@property (nullable, nonatomic, retain) NSSet<CDAgency *> *allAgencies;
@property (nullable, nonatomic, retain) NSSet<CDBorrower *> *allBorrowers;
@property (nullable, nonatomic, retain) NSSet<CDProject *> *allProjects;

+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc;
- (void)addAllAgenciesObject:(CDAgency *)value;
- (void)removeAllAgenciesObject:(CDAgency *)value;
- (void)addAllAgencies:(NSSet<CDAgency *> *)values;
- (void)removeAllAgencies:(NSSet<CDAgency *> *)values;

- (void)addAllBorrowersObject:(CDBorrower *)value;
- (void)removeAllBorrowersObject:(CDBorrower *)value;
- (void)addAllBorrowers:(NSSet<CDBorrower *> *)values;
- (void)removeAllBorrowers:(NSSet<CDBorrower *> *)values;

- (void)addAllProjectsObject:(CDProject *)value;
- (void)removeAllProjectsObject:(CDProject *)value;
- (void)addAllProjects:(NSSet<CDProject *> *)values;
- (void)removeAllProjects:(NSSet<CDProject *> *)values;

@end

NS_ASSUME_NONNULL_END

#import "CDCountry+CoreDataProperties.h"
