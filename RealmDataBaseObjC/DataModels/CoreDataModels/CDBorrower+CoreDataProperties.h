//
//  CDBorrower+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDBorrower.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDBorrower (CoreDataProperties)



@property (nullable, nonatomic, retain) NSString *bName;
@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) CDProject *borrowedProjects;
@property (nullable, nonatomic, retain) CDCountry *fromCountry;


@end

@interface CDBorrower (CoreDataGeneratedAccessors)


+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc;
- (void)addBorrowedProjectsObject:(CDProject *)value;
- (void)removeBorrowedProjectsObject:(CDProject *)value;
- (void)addBorrowedProjects:(NSSet<CDProject *> *)values;
- (void)removeBorrowedProjects:(NSSet<CDProject *> *)values;
- (void)setFromCountry:(CDCountry *)fromCountry;

@end

NS_ASSUME_NONNULL_END
