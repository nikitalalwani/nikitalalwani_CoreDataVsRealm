//
//  CDStatus+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDStatus.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDStatus (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
