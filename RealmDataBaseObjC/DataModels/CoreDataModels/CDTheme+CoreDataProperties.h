//
//  CDTheme+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDTheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDTheme (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<CDProject *> *allProjects;

@end

@interface CDTheme (CoreDataGeneratedAccessors)

- (void)addAllProjectsObject:(CDProject *)value;
- (void)removeAllProjectsObject:(CDProject *)value;
- (void)addAllProjects:(NSSet<CDProject *> *)values;
- (void)removeAllProjects:(NSSet<CDProject *> *)values;

@end

NS_ASSUME_NONNULL_END
