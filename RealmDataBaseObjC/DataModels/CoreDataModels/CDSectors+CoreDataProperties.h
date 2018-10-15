//
//  CDSectors+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDSectors.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDSectors (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<CDSubSecotr *> *secondarySectors;

@end

@interface CDSectors (CoreDataGeneratedAccessors)

- (void)addSecondarySectorsObject:(CDSubSecotr *)value;
- (void)removeSecondarySectorsObject:(CDSubSecotr *)value;
- (void)addSecondarySectors:(NSSet<CDSubSecotr *> *)values;
- (void)removeSecondarySectors:(NSSet<CDSubSecotr *> *)values;

@end

NS_ASSUME_NONNULL_END
