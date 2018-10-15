//
//  ProjectsViewController.h
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectListVm.h"

typedef NS_ENUM(NSInteger, FILTER_TYPE) {
    FILTER_TYPE_THEME = 0,
    FILTER_TYPE_BORROWER,
    FILTER_TYPE_COUNTRY,
    FILTER_TYPE_SECTOR
};

@interface ProjectsViewController : UIViewController <ProjectListVmDelegate, UITableViewDelegate, UITableViewDataSource>

@end
