//
//  ProjectListVm.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "ProjectListVm.h"
#import "ApplicationLayer.h"
#import "DataBaseManager.h"

@interface ProjectListVm()

@property (nonatomic, strong) NSMutableArray<DMProject*> *projectList;
@property (nonatomic, weak  ) id<ProjectListVmDelegate>  delegate;
@end


@implementation ProjectListVm


- (id)initWithController:(APPController*)controller  withDelegate:(id<ProjectListVmDelegate>)delegate{
    
    self = [super init];
    
    if (self)
    {
        self.delegate = delegate;
    }
    
    return self;
}

-(NSMutableArray*)getArrayForProjectList
{
    self.projectList = [[APPController sharedInstance] getProjectsFromDB];
    return self.projectList;
}

-(NSMutableArray*)getArrayForTheme
{
    return [[APPController sharedInstance] getThemeFromDB];
}

-(NSMutableArray*)getArrayForBorrower
{
    return [[APPController sharedInstance] getBorrowerFromDB];
}
-(NSMutableArray*)getArrayForCountry
{
    return [[APPController sharedInstance] getCountryFromDB];
}

-(NSMutableArray*)getArrayForSector
{
    return [[APPController sharedInstance] getSectorFromDB];
}
@end

