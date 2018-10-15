//
//  CDPrimeDistribution+CoreDataProperties.h
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDPrimeDistribution.h"
#import "DataConstants.h"

NS_ASSUME_NONNULL_BEGIN

@class CDSectors;
@interface CDPrimeDistribution (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *percentile;
@property (nullable, nonatomic, retain) CDSectors *forSector;

@end

NS_ASSUME_NONNULL_END
