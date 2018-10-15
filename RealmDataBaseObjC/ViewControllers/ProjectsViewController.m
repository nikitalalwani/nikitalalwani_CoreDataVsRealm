//
//  ProjectsViewController.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "ProjectsViewController.h"
#import "ApplicationLayer.h"
#import "DataBaseManager.h"
#import "FilterPopUpViewViewController.h"
#import "CDProject.h"



@interface ProjectsViewController ()

#define CellID @"Cell"

// IBOutlets
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;



// Others
@property (strong, nonatomic) ProjectListVm *projectListVm;
@property (strong, nonatomic) NSArray *allProjects;

@end

@implementation ProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 150.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    self.projectListVm = [[ApplicationLayer sharedInstance] getprojectListVmWithdelegate:weakSelf];
    self.allProjects = [self.projectListVm getArrayForProjectList];
    
    
  //  NSLog(@"self.allProjects = %@", self.allProjects);
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
}

#pragma mark - Action methods


- (IBAction)themeFilterTapped:(id)sender {
    [self showViewController:FILTER_TYPE_THEME];
}


- (IBAction)borrowersFilterTapped:(id)sender {
    [self showViewController:FILTER_TYPE_BORROWER];
}


- (IBAction)countryFilterTapped:(id)sender {
    [self showViewController:FILTER_TYPE_COUNTRY];
}


- (IBAction)sectorsFilterTapped:(id)sender {
    [self showViewController:FILTER_TYPE_SECTOR];
}


-(void)showViewController:(FILTER_TYPE)filterType{
    
    FilterPopUpViewViewController *filterPopUpVC = [[FilterPopUpViewViewController alloc] initWithDelegate:self];
    
    NSString *title = @"Filter";
    filterPopUpVC.filterType = filterType;
    switch(filterType)
    {
        case FILTER_TYPE_THEME:
        {
            filterPopUpVC.arrayFilter = [self.projectListVm getArrayForTheme];
            title = @"Theme";
        }
            break;
        case FILTER_TYPE_BORROWER:
        {
            filterPopUpVC.arrayFilter = [self.projectListVm getArrayForBorrower];
            title = @"Borrower";
        }
            break;
        case FILTER_TYPE_COUNTRY:
        {
            filterPopUpVC.arrayFilter = [self.projectListVm getArrayForCountry];
            title = @"Country";
        }
            break;
        case FILTER_TYPE_SECTOR:
        {
            filterPopUpVC.arrayFilter = [self.projectListVm getArrayForSector];
            title = @"Sector";
        }
            break;
        default:
            break;
    }
    filterPopUpVC.titleLabel.text = title;
    
    [self.view addSubview:filterPopUpVC.view];
    [self addChildViewController:filterPopUpVC];
    filterPopUpVC.view.frame = self.view.frame;
   // NSLog(@"self.frame = %f", self.view.frame.size.height);
}

#pragma mark - TableViewDelegate / DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allProjects.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    }
    
    CDProject *project = self.allProjects[indexPath.row];
    
    cell.textLabel.text = project.name;
    cell.detailTextLabel.text = project.comAmmount;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"dbPlaceHolder.png"];
    return cell;
}

@end
