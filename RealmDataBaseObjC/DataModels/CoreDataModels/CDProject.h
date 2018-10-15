//
//  CDProject.h
//  
//
//  Created by Globallogic on 05/06/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@class CDAgency, CDBorrower,CDCountry,CDProjectDocs, CDTheme, CDStatus, CDFinanceType,CDProdLine,CDSecondaryDistribution,CDPrimeDistribution;

@interface CDProject : NSManagedObject

@property (nullable, nonatomic, retain) NSDate *boardApprovalDate;
@property (nullable, nonatomic, retain) NSString *boardApprovedMonth;
@property (nullable, nonatomic, retain) NSDate *closingDate;
@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *comAmmount;
@property (nullable, nonatomic, retain) NSString *docAmmount;
@property (nullable, nonatomic, retain) NSString *grantAmmount;
@property (nullable, nonatomic, retain) NSString *information;
@property (nullable, nonatomic, retain) NSString *lendingCost;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *region;
@property (nullable, nonatomic, retain) NSString *totalAmount;
@property (nullable, nonatomic, retain) NSString *urlPath;
@property (nullable, nonatomic, retain) CDAgency *agency;
@property (nullable, nonatomic, retain) NSSet<CDProjectDocs *> *allDocs;
@property (nullable, nonatomic, retain) NSSet<CDTheme *> *allThemes;
@property (nullable, nonatomic, retain) CDBorrower *borrower;
@property (nullable, nonatomic, retain) CDStatus *displayStatus;
@property (nullable, nonatomic, retain) CDFinanceType *financetype;
@property (nullable, nonatomic, retain) CDCountry *hostCountry;
@property (nullable, nonatomic, retain) NSSet<CDPrimeDistribution *> *primaryDistribuion;
@property (nullable, nonatomic, retain) CDStatus *projectStatus;
@property (nullable, nonatomic, retain) CDProdLine *prouctLineDetails;
@property (nullable, nonatomic, retain) NSSet<CDSecondaryDistribution *> *secondaryDistribution;

@end

NS_ASSUME_NONNULL_END

#import "CDProject+CoreDataProperties.h"
