//
//  ApplicationLayer.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectListVm.h"
#import "APPController.h"





@interface ApplicationLayer : NSObject

+ (id)sharedInstance;
- (ProjectListVm*)getprojectListVmWithdelegate:(id<ProjectListVmDelegate>)aDelegate ;

@end
