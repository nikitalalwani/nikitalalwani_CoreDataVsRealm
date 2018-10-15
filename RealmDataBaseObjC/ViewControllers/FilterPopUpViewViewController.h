//
//  FilterPopUpViewViewController.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 21/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectsViewController.h"

@protocol FilterPopUpViewDelegate <NSObject>



@end


@interface FilterPopUpViewViewController : UIViewController


@property (nonatomic, strong) NSArray *arrayFilter;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (readwrite, assign) FILTER_TYPE filterType;
@property (nonatomic, strong) NSString *keyFilterBy;
@property (weak, nonatomic) IBOutlet UIView *filterView;

-(instancetype)initWithDelegate:(id<FilterPopUpViewDelegate>)delegate;

@end
