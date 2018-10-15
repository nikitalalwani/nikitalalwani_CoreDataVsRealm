//
//  DataBaseManager.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseFactory.h"
#import "AppController.h"

#define MAX_DATA_REPEAT_COUNT 1

@interface DataBaseManager : NSObject<DatabseProtocol>

- (instancetype)initDatabaseManager;

@end
