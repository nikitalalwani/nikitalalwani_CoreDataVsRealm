//
//  APPController.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "APPController.h"


@interface APPController()

@property (nonatomic, strong)   id<DatabseProtocol> databaseManager;
@end

@implementation APPController

static APPController *sharedAppController = nil;


+ (id)sharedInstance {
    
    
    if(sharedAppController == nil)
    {
        sharedAppController = [[self alloc] initWithDefaultController];
    }
    
    return sharedAppController;
}



- (id)initWithDefaultController
{
    self = [self init];
    if(self)
    {
        [self getDatabaseManager];
        
    }
    return self;
}


-(id<DatabseProtocol>)getDatabaseManager{

    DatabaseFactory* factory = [[DatabaseFactory alloc] init];

    if(self.databaseManager == nil)
        self.databaseManager = [factory createDatabaseManager];
    return  self.databaseManager;
}

-(NSMutableArray*)getProjectsFromDB
{
   return  [self.databaseManager getAllProjects];
}
-(NSMutableArray*)getThemeFromDB
{
    return [self.databaseManager getAllThemes];
}
-(NSMutableArray*)getCountryFromDB
{
    return [self.databaseManager getAllCountries];
}

-(NSMutableArray*)getBorrowerFromDB
{
    return [self.databaseManager getAllBorrowers];
}
-(NSMutableArray*)getSectorFromDB
{
    return [self.databaseManager getAllSectors];
}
@end
