//
//  DatabaseFactory.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "DatabaseFactory.h"
#import "CoreDataManager.h"
#import "RealmManager.h"

@interface DatabaseFactory()
@property(nonatomic) id <DatabseProtocol> databaseProtocol;

@end

@implementation DatabaseFactory




- (id<DatabseProtocol>)createDatabaseManager{

    
    DatabaseType type = DatabaseTypeCoreData;
    
    switch (type) {
        case DatabaseTypeCoreData:
            self.databaseProtocol = [[CoreDataManager alloc] initDatabaseManager];
        break;
        
        case DatabaseTypeRealM:
        
        self.databaseProtocol = [[RealmManager alloc] initDatabaseManager];
        break;
        
        default:
        self.databaseProtocol = [[CoreDataManager alloc] initDatabaseManager];
        break;
    }
    return self.databaseProtocol;

}

-(NSMutableArray*)getAllProjectsFromDb{

    return [self.databaseProtocol getAllProjects];
}

@end
