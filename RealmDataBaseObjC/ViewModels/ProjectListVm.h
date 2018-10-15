//
//  ProjectListVm.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMProject.h"


@class APPController;

@protocol ProjectListVmDelegate <NSObject>

-(NSMutableArray*)arrayForProjectList;

@end

@interface ProjectListVm : NSObject

- (id)initWithController:(APPController*)controller  withDelegate:(id<ProjectListVmDelegate>)delegate;
- (NSMutableArray*)getArrayForProjectList;
- (NSMutableArray*)getArrayForTheme;
-(NSMutableArray*)getArrayForBorrower;
-(NSMutableArray*)getArrayForCountry;
-(NSMutableArray*)getArrayForSector;
@end
