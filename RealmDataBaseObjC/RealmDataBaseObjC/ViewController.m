//
//  ViewController.m
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 15/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "BankCustomer.h"
#import "BankDataCell.h"
#import "coreDataViewController.h"
const NSString *cellID = @"BankDataCell";
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayOfData;
    RLMResults *queryResults;
    NSMutableData *key;
    NSTimeInterval insertionExecutionTime;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property RLMRealm *realm;
@property RLMResults *arrayOFDataRetrived;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitiyIndicator;
@property (weak, nonatomic) IBOutlet UILabel *labelTimer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayOfData = [NSMutableArray new];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.realm = [RLMRealm defaultRealm];
    [self.tableView registerNib:[UINib nibWithNibName:@"BankDataCell" bundle:nil] forCellReuseIdentifier:@"BankDataCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self showActivityIndicator];
    NSDate *date = [NSDate date];
    [self deleteData];
    NSDate *methodFinish = [NSDate date];
    [self timeRequired:date endDate:methodFinish strMessage:@"Realm:Time required for deleting data is "];
    [self downloadAndFetchData];
}
-(void)viewDidDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notificationName" object:nil];
}
#pragma mark - Deleting all data

-(void)deleteData
{
    [self.realm beginWriteTransaction];
    [self.realm deleteAllObjects];
    [self.realm commitWriteTransaction];
}
#pragma mark- Downloading data and displaying in tableview

-(void)downloadAndFetchData
{
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    NSArray *arrOFDA = app.arrayOfData;
    if ([arrOFDA count] == 0)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadAndFetchData) name:@"notificationName" object:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           [app getData];
                       });
    }
    else
    {
        dispatch_async(dispatch_get_global_queue
                       (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
                       {
                           
                           dispatch_async(dispatch_get_main_queue(), ^{
                               NSDate *methodStart = [NSDate date];
                               [self addDataToRealm];
                               NSDate *methodFinish = [NSDate date];
                               [self timeRequired:methodStart endDate:methodFinish strMessage:@"Realm:Time required for saving data is "];
                               self.labelTimer.text = [NSString stringWithFormat:@"Realm:Time Required for saving data is %0.00f",round(insertionExecutionTime)];
                                NSDate *methodStartForReading = [NSDate date];
                               [self retriveData];
                               NSDate *methodFinishForReading = [NSDate date];
                               [self timeRequired:methodStartForReading endDate:methodFinishForReading strMessage:@"Realm:Time required for fetching data is"];
                           });
                       });
    }
}


-(void)timeRequired:(NSDate *)startDate
            endDate:(NSDate*)endDate
         strMessage:(NSString *)strMessage
{
        NSTimeInterval executionTime = [endDate    timeIntervalSinceDate:startDate];
    insertionExecutionTime = executionTime;
    NSLog(@"%@ %0.00f",strMessage,round(executionTime));
}


-(void)addDataToRealm
{
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    // app.arrayOfData
    NSArray *arrOFDA = app.arrayOfData;
    [self.realm beginWriteTransaction];
    for (id item in arrOFDA)
    {
        BankCustomer *realmObject = [BankCustomer new];
        realmObject.borrower = [item valueForKey:@"borrower"];
        realmObject.countryshortname = [item valueForKey:@"countryshortname"];
        realmObject.imageURL = [item valueForKey:@"imageURL"];
        realmObject.project_name = [item valueForKey:@"project_name"];
        realmObject.project_abstract = [[item valueForKey:@"project_abstract"]valueForKey:@"cdata"];
        realmObject.url = [item valueForKey:@"url"];
        [self.realm addObject:realmObject];
    }
    [self.realm commitWriteTransaction];
}

-(void)retriveData
{
    _arrayOFDataRetrived  = [BankCustomer allObjects];
    [self.tableView reloadData];
    [self hideActivityIndicator];
}

#pragma mark- Tableview delegates and DataSource method
#define CELLID @"BankDataCell"
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BankDataCell *bankDataCell = [self.tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    BankCustomer *obj = _arrayOFDataRetrived[indexPath.row];
    NSString *imageURL = @"http://brentcarnduff.com/wp-content/uploads/2014/08/url-small.jpg";
    [bankDataCell configureCell:obj];
    [bankDataCell loadImage:imageURL];
    return bankDataCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayOFDataRetrived.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 112;
}

#pragma mark - Activity Indicator Methods

-(void)showActivityIndicator
{
    [self.activitiyIndicator startAnimating];
    self.activitiyIndicator.alpha = 1;
}

-(void)hideActivityIndicator
{
    [self.activitiyIndicator stopAnimating];
    self.activitiyIndicator.alpha = 0;
}
@end
