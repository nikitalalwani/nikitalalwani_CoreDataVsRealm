//
//  CoreDataManager.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataBaseManager.h"
#import "CDBorrower.h"
#import "DataConstants.h"
#import "CDProject.h"
#import "AppUtility.h"
#import "CalculateTime.h"

@interface CoreDataManager : DataBaseManager
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (CoreDataManager *)sharedManager;


@end
