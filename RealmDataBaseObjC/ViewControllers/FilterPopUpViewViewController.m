//
//  FilterPopUpViewViewController.m
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 21/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "FilterPopUpViewViewController.h"
#import "CDProject.h"

#define CELL_ID @"CellID"

@interface FilterPopUpViewViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnApplyFilter;
@property (nonatomic, weak) id <FilterPopUpViewDelegate> delegate;
@end


@implementation FilterPopUpViewViewController


-(instancetype)initWithDelegate:(id<FilterPopUpViewDelegate>)delegate{
    
    if(self = [super initWithNibName:@"FilterPopUpViewViewController" bundle:nil])
    {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tblView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    self.tblView.estimatedRowHeight = 150.0f;
    self.tblView.rowHeight = UITableViewAutomaticDimension;
    
    self.filterView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.filterView.layer.borderWidth = 1;
    
    self.filterView.layer.shadowOpacity = 0.4;
    self.filterView.layer.shadowOffset = CGSizeMake(-2, 2);
    self.filterView.layer.shadowColor = [UIColor grayColor].CGColor;
}
- (IBAction)didTapOnButton:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if (btn == self.btnCancel){
        NSLog(@"Just Dismissing the Popup");
    }else if(btn == self.btnApplyFilter){
        NSLog(@"Dismissing the Popup and setting Filter");
    }
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.numberOfLines = 0;
    cell.detailTextLabel.numberOfLines = 0;
    
    switch (self.filterType) {
        case FILTER_TYPE_THEME:
        {
            CDTheme *theme = self.arrayFilter[indexPath.row];
            cell.textLabel.text = theme.code;
            cell.detailTextLabel.text = theme.name;
        }
            break;
        case FILTER_TYPE_SECTOR:
        {
            CDSectors *sectors = self.arrayFilter[indexPath.row];
            cell.textLabel.text = sectors.code;
            cell.detailTextLabel.text = sectors.name;
        }
            break;
        case FILTER_TYPE_COUNTRY:
        {
            CDCountry *country = self.arrayFilter[indexPath.row];
            cell.textLabel.text = country.code;
            cell.detailTextLabel.text = country.countryName;
        }
            break;
        case FILTER_TYPE_BORROWER:
        {
            CDBorrower *borrower = self.arrayFilter[indexPath.row];
            cell.textLabel.text = borrower.code;
            cell.detailTextLabel.text = borrower.bName;
        }
            break;
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.keyFilterBy = @"";
    switch (self.filterType) {
            
        case FILTER_TYPE_THEME:
        {
            CDTheme *theme = self.arrayFilter[indexPath.row];
            self.keyFilterBy = theme.code;
        }
            break;
        case FILTER_TYPE_SECTOR:
        {
            CDSectors *sectors = self.arrayFilter[indexPath.row];
            self.keyFilterBy = sectors.code;
        }
            break;
        case FILTER_TYPE_COUNTRY:
        {
            CDCountry *country = self.arrayFilter[indexPath.row];
           self.keyFilterBy = country.code;
        }
            break;
        case FILTER_TYPE_BORROWER:
        {
            CDBorrower *borrower = self.arrayFilter[indexPath.row];
            self.keyFilterBy = borrower.code;
        }
        break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayFilter.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
