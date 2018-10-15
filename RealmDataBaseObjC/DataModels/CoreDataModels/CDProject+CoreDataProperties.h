//
//  CDProject+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDProject.h"
#import "DataConstants.h"

NS_ASSUME_NONNULL_BEGIN



@interface CDProject (CoreDataProperties)




@end

@interface CDProject (CoreDataGeneratedAccessors)

+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc;

- (void)addAllDocsObject:(CDProjectDocs *)value;
- (void)removeAllDocsObject:(CDProjectDocs *)value;
- (void)addAllDocs:(NSSet<CDProjectDocs *> *)values;
- (void)removeAllDocs:(NSSet<CDProjectDocs *> *)values;

- (void)addAllThemesObject:(CDTheme *)value;
- (void)removeAllThemesObject:(CDTheme *)value;
- (void)addAllThemes:(NSSet<CDTheme *> *)values;
- (void)removeAllThemes:(NSSet<CDTheme *> *)values;

- (void)addPrimaryDistribuionObject:(CDPrimeDistribution *)value;
- (void)removePrimaryDistribuionObject:(CDPrimeDistribution *)value;
- (void)addPrimaryDistribuion:(NSSet<CDPrimeDistribution *> *)values;
- (void)removePrimaryDistribuion:(NSSet<CDPrimeDistribution *> *)values;

- (void)addSecondaryDistributionObject:(CDSecondaryDistribution *)value;
- (void)removeSecondaryDistributionObject:(CDSecondaryDistribution *)value;
- (void)addSecondaryDistribution:(NSSet<CDSecondaryDistribution *> *)values;
- (void)removeSecondaryDistribution:(NSSet<CDSecondaryDistribution *> *)values;

@end

NS_ASSUME_NONNULL_END
