//
//  CDProjectDocs+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDProjectDocs.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDProjectDocs (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *urlPath;
@property (nullable, nonatomic, retain) CDProject *forProject;
@property (nullable, nonatomic, retain) CDDocType *type;

@end

NS_ASSUME_NONNULL_END
