//
//  APPController.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseFactory.h"

@interface APPController : NSObject




+ (id)sharedInstance;
-(NSMutableArray*)getProjectsFromDB;
-(NSMutableArray*)getThemeFromDB;
-(NSMutableArray*)getCountryFromDB;
-(NSMutableArray*)getBorrowerFromDB;
-(NSMutableArray*)getSectorFromDB;
@end
