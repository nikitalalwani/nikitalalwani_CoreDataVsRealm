//
//  coreDataViewController.m
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 19/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "coreDataViewController.h"
#import "BankDataCell.h"
#import "World_Bank.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface coreDataViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayOfData;
    NSTimeInterval insertionExecutionTime;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activitiyIndicator;
@property (weak, nonatomic) IBOutlet UILabel *labelTimer;
@end

@implementation coreDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayOfData = [NSMutableArray new];
    // Do any additional setup after loading the view.
    [self showActivityIndicator];
    [self.tableView registerNib:[UINib nibWithNibName:@"BankDataCell" bundle:nil] forCellReuseIdentifier:@"BankDataCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    NSDate *date = [NSDate date];
    [self deleteAllData];
    NSDate *methodFinish = [NSDate date];
    [self timeRequired:date endDate:methodFinish strMessage:@"Core:Time required for deleting data is "];
    [self downloadAndFetchData];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notificationName" object:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    // [self deleteAllData];
    // [self downloadAndFetchData];
}

#pragma mark - Deleting all data
-(void)deleteAllData
{
    NSManagedObjectContext * moc = [self defaultManagedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"World_Bank"];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [moc deleteObject:object];
    }
    error = nil;
    [moc save:&error];
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
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
                       {
                           NSString *filePath = [[NSBundle mainBundle] pathForResource:@"world_bank" ofType:@"json"];
                           NSData *data = [NSData dataWithContentsOfFile:filePath];
                           if (data) {
                               NSError *error;
                               NSArray *temp = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                               for(int count =  0; count < MAX_DATA_REPEAT_COUNT; count++)
                               {
                                   for(int index = 0; index < temp.count; index++)
                                   {
                                       [arrayOfData addObject:[temp objectAtIndex:index]];
                                   }
                               }
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   NSDate *date = [NSDate date];
                                   [self addDataToCoreData];
                                   
                                   NSDate *methodFinish = [NSDate date];
                                    [self timeRequired:date endDate:methodFinish strMessage:@"Core:Time required for saving data is "];
                                   self.labelTimer.text = [NSString stringWithFormat:@"Time Required for fetching data is %f",round(insertionExecutionTime)];
                                   NSDate *methodStartForReading = [NSDate date];
                                  [self retriveData:date];
                                   NSDate *methodFinishForReading = [NSDate date];
                                   [self timeRequired:methodStartForReading endDate:methodFinishForReading strMessage:@"Realm:Time required for fetching data is"];
                                
                               });
                           }
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

-(void)addDataToCoreData
{
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    // app.arrayOfData
    NSArray *arrOFDA = app.arrayOfData;
    for (id item in arrOFDA)
    {
        NSManagedObjectContext * moc = [self defaultManagedObjectContext];
        World_Bank *newBankRecord = [NSEntityDescription insertNewObjectForEntityForName:@"World_Bank" inManagedObjectContext:moc];
        newBankRecord.borrower = [item valueForKey:@"borrower"];
        newBankRecord.countryshortname = [item valueForKey:@"countryshortname"];
        newBankRecord.project_name = [item valueForKey:@"project_name"];
        newBankRecord.project_abstract = [[item valueForKey:@"project_abstract"]valueForKey:@"cdata"];
        newBankRecord.imageURL = nil;//[item valueForKey:@""];
        newBankRecord.url = [item valueForKey:@"url"];
        NSError *error = nil;
        if (![moc save:&error]) {
            // Save failed
            NSLog(@"Core Data Save Error: %@, %@", error, [error userInfo]);
        }
    }
}
-(void)retriveData:(NSDate *)date
{
    NSManagedObjectContext * moc = [self defaultManagedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"World_Bank"];
    NSError *error = nil;
    arrayOfData = [moc executeFetchRequest:fetchRequest error:&error];
    if ([arrayOfData count] != 0)
    {
        [self.tableView reloadData];
    }
    [self hideActivityIndicator];
    
}


#pragma mark - MOC declaration
- (NSManagedObjectContext *) defaultManagedObjectContext
{
    NSManagedObjectContext *moc = nil;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(managedObjectContext)]) {
        moc = [appDelegate managedObjectContext];
    }
    return moc;
}

#pragma mark- Tableview delegates and DataSource method
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([arrayOfData count] != 0)
    {
        return [arrayOfData count];
    }
    return 0;
}
#define CELLID @"BankDataCell"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BankDataCell *bankDataCell =  [self.tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    World_Bank *obj = (World_Bank*)arrayOfData[indexPath.row];
    [bankDataCell configureCellForCoreData:obj];
    NSString *imageURL = @"http://brentcarnduff.com/wp-content/uploads/2014/08/url-small.jpg";
    [bankDataCell loadImage:imageURL];
    return bankDataCell;
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
