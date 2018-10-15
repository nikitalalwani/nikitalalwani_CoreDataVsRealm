//
//  CDSecondaryDistribution+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDSecondaryDistribution.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDSecondaryDistribution (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *percentile;
@property (nullable, nonatomic, retain) CDSubSecotr *forSubSector;

@end

NS_ASSUME_NONNULL_END
