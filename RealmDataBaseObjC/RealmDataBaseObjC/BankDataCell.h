//
//  BankDataCell.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 19/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankCustomer.h"
#import "World_Bank.h"

#define MAX_DATA_REPEAT_COUNT 10
@interface BankDataCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblBorrowerName;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *imageDP;
@property (weak, nonatomic) IBOutlet UILabel *lblCountryShortName;
- (void) configureCell : (BankCustomer*) obj;
- (void) configureCellForCoreData : (World_Bank*) obj;
- (void) loadImage :(NSString *)imageURL;
@end
