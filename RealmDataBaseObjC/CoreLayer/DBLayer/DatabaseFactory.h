//
//  DatabaseFactory.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DatabaseType)
{
    DatabaseTypeCoreData,
    DatabaseTypeRealM,
    DatabaseTypeUnknown
};

@protocol DatabseProtocol <NSObject>

+ (nonnull instancetype)initDatabaseManager;

-(NSMutableArray*)getAllProjects;
-(NSMutableArray*)getAllThemes;
-(NSMutableArray*)getAllCountries;
-(NSMutableArray*)getAllBorrowers;
-(NSMutableArray*)getAllSectors;

@optional
- (void)tearDown;

@end

@interface DatabaseFactory : NSObject

- (id<DatabseProtocol>)createDatabaseManager;
-(NSMutableArray*)getAllProjectsFromDb;
-(NSMutableArray*)getAllThemeFromDb;
-(NSMutableArray*)getAllCountryFromDb;
-(NSMutableArray*)getAllBorrowerFromDb;
-(NSMutableArray*)getAllSectorFromDb;
@end
