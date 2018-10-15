//
//  BankDataCell.m
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 19/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "BankDataCell.h"
#import "BankCustomer.h"
#import "World_Bank.h"
@implementation BankDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void) configureCell : (BankCustomer*) obj
{
    self.lblBorrowerName.text = [obj borrower];
    self.lblCountryShortName.text = [obj countryshortname];
}
- (void) configureCellForCoreData : (World_Bank*) obj
{
    self.lblBorrowerName.text = [obj borrower];
    self.lblCountryShortName.text = [obj countryshortname];
}

- (void)loadImage :(NSString *)imageURL
{
    [self.activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSURL *url = [NSURL URLWithString:imageURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageDP.image = [UIImage imageWithData:data];
            [self.activityIndicator stopAnimating];
            self.activityIndicator.alpha = 0;
        });
    });
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
