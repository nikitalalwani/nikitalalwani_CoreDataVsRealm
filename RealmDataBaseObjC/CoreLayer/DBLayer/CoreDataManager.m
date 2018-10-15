//
//  CoreDataManager.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager()<NSFetchedResultsControllerDelegate>
{
    CDProject* newProject;
    CDAgency* newAgency;
    CDStatus* newStatus;
    CDBorrower* newborrower;
    CDFinanceType* newFinanceType;
    CDCountry* newCountry;
    CDProdLine* newProdLine;
    CDProjectDocs* newDocs;
    CDLendingDetails* newLendingDetails;
    CDPrimeDistribution* newPrimeDistribution;
    CDSectors* newSector;
    CDTheme* newTheme;
    CDSecondaryDistribution* newSecDistribution;
    CDSubSecotr* newSubSector;
    CDDocType* newDocType;
}
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContextObj;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModelObj;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinatorObj;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end



#define MAX_DATA_REPEAT_COUNT 1
@implementation CoreDataManager

@synthesize managedObjectContextObj = _managedObjectContext;
@synthesize managedObjectModelObj = _managedObjectModel;
@synthesize persistentStoreCoordinatorObj = _persistentStoreCoordinator;

static CoreDataManager *sharedInstance = nil;


- (NSMutableArray*)getAllProjects{
    return [self fetchDataFromCoreDataforEntity:@"CDProject"];
}

- (NSMutableArray*)getAllThemes{
    
    return [self fetchDataFromCoreDataforEntity:@"CDTheme"];
}

- (NSMutableArray*)getAllCountries{
    
    return [self fetchDataFromCoreDataforEntity:@"CDCountry"];
}

- (NSMutableArray*)getAllSectors{
    
    return [self fetchDataFromCoreDataforEntity:@"CDSectors"];
}

- (NSMutableArray*)getAllBorrowers{
    
    return [self fetchDataFromCoreDataforEntity:@"CDBorrower"];
}



+ (CoreDataManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[CoreDataManager alloc]init];
    });
    return sharedInstance;
}


-(id)initDatabaseManager
{
    
    self = [super initDatabaseManager];
    if(self)
    {
        self.managedObjectContextObj = [[CoreDataManager sharedManager]managedObjectContext];
    }
    [[CalculateTime sharedInstance]StartTime];
    [self insertDataForFirsttime];
    
    return self;
}


-(void)insertDataForFirsttime
{
    
    NSMutableArray* arrayOfData = [NSMutableArray new];
    
    //dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"world_bank_data" ofType:@"json"];
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
            [self insertDataForFirsttime:arrayOfData];
        }
    }
}


- (BOOL)updateOrInsert:(NSString*)entityName withUniqueCode:(id)code

{
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:self.managedObjectContextObj];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"code==%@",code];
    [request setPredicate:predicate];
    
    NSError* error = nil;
    NSArray *fetchedRecords = [self.managedObjectContextObj executeFetchRequest:request error:&error];
    
    if (fetchedRecords.count>0 )
    {
        return NO;
    }
    else
    {
        return YES;
    }
    
    
}



-(void)insertDataForFirsttime:(NSMutableArray*)arrayOfData

{
    NSInteger index = 0;
    for (id item in arrayOfData)
    {
        NSManagedObjectContext* moc = self.managedObjectContextObj;
        NSError* error  = nil;
        
        //CDCountry
        if ([self updateOrInsert:@"CDCountry" withUniqueCode:[item valueForKey:@"countryshortname"]])
        {
            newCountry =[NSEntityDescription insertNewObjectForEntityForName:@"CDCountry" inManagedObjectContext:moc];
            
            newCountry.code = [item valueForKey:@"countryshortname"];
            newCountry.countryName = [item valueForKey:@"countryname"];
            newCountry.displayName = [item valueForKey:@"countryshortname"];
        }
        else
        {
            [newCountry setValue:[item valueForKey:@"country_namecode"] forKey:@"code"];
            [newCountry setValue:[item valueForKey:@"countryname"] forKey:@"countryName"];
            [newCountry setValue:[item valueForKey:@"countryshortname"] forKey:@"displayName"];
        }
        
        
        //CDDocType
        if ([self updateOrInsert:@"CDDocType" withUniqueCode:[item valueForKey:@"docty"]])
        {
            newDocType = [NSEntityDescription insertNewObjectForEntityForName:@"CDDocType" inManagedObjectContext:moc];
            newDocType.code = [item valueForKey:@"docty"];
            newDocType.type = [item valueForKey:@"docty"];
        }
        else
        {
            [newDocType setValue:[item valueForKey:@"docty"] forKey:@"code"];
            [newDocType setValue:[item valueForKey:@"docty"] forKey:@"type"];
            
        }
        
        
        //CDFinanceType
        if ([self updateOrInsert:@"CDFinanceType" withUniqueCode:[item valueForKey:@"projectfinancialtype"]])
        {
            newFinanceType =[NSEntityDescription insertNewObjectForEntityForName:@"CDFinanceType" inManagedObjectContext:moc];
            
            newFinanceType.code = [item valueForKey:@"projectfinancialtype"];
            newFinanceType.name = [item valueForKey:@"project_name"];
        }
        else
        {
            [newFinanceType setValue:[item valueForKey:@"projectfinancialtype"] forKey:@"code"];
            [newFinanceType setValue:[item valueForKey:@"project_name"] forKey:@"name"];
        }
        
        
        //CDLendingDetails
        if ([self updateOrInsert:@"CDLendingDetails" withUniqueCode:[item valueForKey:@"lendinginstrtype"]])
        {
            newLendingDetails = [NSEntityDescription insertNewObjectForEntityForName:@"CDLendingDetails" inManagedObjectContext:moc];
            
            newLendingDetails.code = [item valueForKey:@"lendinginstrtype"];
            newLendingDetails.name = [item valueForKey:@"lendinginstr"];
        }
        else
        {
            [newLendingDetails setValue:[item valueForKey:@"lendinginstr"] forKey:@"code"];
            [newLendingDetails setValue:[item valueForKey:@"lendinginstr"] forKey:@"name"];
        }
        
        
        //CDProdLine
        if ([self updateOrInsert:@"CDProdLine" withUniqueCode:[item valueForKey:@"prodline"]])
        {
            
            newProdLine =[NSEntityDescription insertNewObjectForEntityForName:@"CDProdLine" inManagedObjectContext:moc];
            
            newProdLine.code =[item valueForKey:@"prodline"];
            newProdLine.lineType =[item valueForKey:@"productlinetype"];
            newProdLine.name =[item valueForKey:@"prodlinetext"];
        }
        else
        {
            [newProdLine setValue:[item valueForKey:@"prodline"] forKey:@"code"];
            [newProdLine setValue:[item valueForKey:@"productlinetype"] forKey:@"lineType"];
            [newProdLine setValue:[item valueForKey:@"prodlinetext"] forKey:@"name"];
        }
        
        
       // CDProject
        if ([self updateOrInsert:@"CDProject" withUniqueCode:[NSString stringWithFormat:@"%ld",(long)index]])
        {
            
            newProject = [NSEntityDescription insertNewObjectForEntityForName:@"CDProject" inManagedObjectContext:moc];
            
            newProject.code = [NSString stringWithFormat:@"%ld",(long)index];
            newProject.boardApprovalDate =[self formatDate:[item valueForKey:@"boardapprovaldate"]];
            newProject.boardApprovedMonth = [item valueForKey:@"board_approval_month"];
            newProject.closingDate = [self formatDate:[item valueForKey:@"closingdate"]];
            NSString* comAmmountString = [NSString stringWithFormat:@"%@",[item valueForKey:@"idacommamt"]];
            newProject.comAmmount =comAmmountString;
            
            NSString* docAmmountString = [NSString stringWithFormat:@"%@",[item valueForKey:@"ibrdcommamt"]];
            newProject.docAmmount = docAmmountString;
            
            NSString* grantAmmountString = [NSString stringWithFormat:@"%@",[item valueForKey:@"grantamt"]];
            newProject.grantAmmount = grantAmmountString;
            
            NSDictionary* info = [item valueForKey:@"project_abstract"];
            newProject.information = [info valueForKey:@"cdata"];
            
            NSString* lendingCostString = [NSString stringWithFormat:@"%@",[item valueForKey:@"lendprojectcost"]];
            newProject.lendingCost = lendingCostString;
            
            newProject.name = [item valueForKey:@"project_name"];
            newProject.region = [item valueForKey:@"regionname"];
            
            NSString* totalAmount = [NSString stringWithFormat:@"%@",[item valueForKey:@"totalamt"]];
            newProject.totalAmount = totalAmount;
            
            newProject.urlPath = [item valueForKey:@"url"];
            
            newProject.borrower = newborrower;
            newProject.agency = newAgency;
            newProject.displayStatus = newStatus;
            newProject.projectStatus = newStatus;
            newProject.financetype=newFinanceType;
            newProject.hostCountry = newCountry;
            newProject.prouctLineDetails = newProdLine;
            
            NSSet* docs = [newProject valueForKey:@"allDocs"];
            newProject.allDocs=docs;
            
            NSSet* themes = [newProject valueForKey:@"allThemes"];
            newProject.allThemes=themes;
            
            NSSet* primeDistributionSet = [newProject valueForKey:@"primaryDistribuion"];
            newProject.primaryDistribuion=primeDistributionSet;
            
            NSSet* secDistribution = [newProject valueForKey:@"secondaryDistribution"];
            newProject.secondaryDistribution=secDistribution;
            
        }
        else
        {
            [newProject setValue:[NSString stringWithFormat:@"%ld",(long)index] forKey:@"code"];
            ;
            
            [newProject setValue:[self formatDate:[item valueForKey:@"boardapprovaldate"]] forKey:@"boardApprovalDate"];
            
            [newProject setValue:[self formatDate:[item valueForKey:@"board_approval_month"]] forKey:@"boardApprovedMonth"];
            
            [newProject setValue:[self formatDate:[item valueForKey:@"closingdate"]] forKey:@"closingDate"];
            
            [newProject setValue:[item valueForKey:@"idacommamt"] forKey:@"comAmmount"];
            [newProject setValue:[item valueForKey:@"ibrdcommamt"] forKey:@"docAmmount"];
            [newProject setValue:[item valueForKey:@"grantamt"] forKey:@"grantAmmount"];
            
            NSDictionary* info = [item valueForKey:@"project_abstract"];
            [newProject setValue:[info valueForKey:@"cdata"] forKey:@"information"];
            
            [newProject setValue:[item valueForKey:@"lendprojectcost"] forKey:@"lendingCost"];
            [newProject setValue:[item valueForKey:@"project_name"] forKey:@"name"];
            [newProject setValue:[item valueForKey:@"regionname"] forKey:@"region"];
            [newProject setValue:[item valueForKey:@"totalamt"] forKey:@"totalAmount"];
            [newProject setValue:[item valueForKey:@"url"] forKey:@"urlPath"];
        }
        
        
        //CDProjectDocs
        NSArray* projectDocType = [item valueForKey:@"projectdocs"];
        for (NSDictionary* projectDocDict in projectDocType)
            
            if ([self updateOrInsert:@"CDProjectDocs" withUniqueCode:[projectDocDict valueForKey:@"EntityID"]])
            {
                
                newDocs =[NSEntityDescription insertNewObjectForEntityForName:@"CDProjectDocs" inManagedObjectContext:moc];
                
                newDocs.code = [projectDocDict valueForKey:@"EntityID"];
                newDocs.name = [projectDocDict valueForKey:@"DocTypeDesc"];
                newDocs.urlPath = [projectDocDict valueForKey:@"DocURL"];
                newDocs.type = newDocType;
                newDocs.forProject = newProject;
                
            }
            else
            {
                [newDocs setValue:[projectDocDict valueForKey:@"EntityID"] forKey:@"code"];
                [newDocs setValue:[projectDocDict valueForKey:@"DocTypeDesc"] forKey:@"name"];
                [newDocs setValue:[projectDocDict valueForKey:@"DocURL"] forKey:@"urlPath"];
            }
        
        
        // CDSectors
        NSArray* sectorArray = [item valueForKey:@"sector_namecode"];
        for (NSDictionary* dictionary in sectorArray)
        {
            if ([self updateOrInsert:@"CDSectors" withUniqueCode:[dictionary valueForKey:@"code"]])
            {
                newSector = [NSEntityDescription insertNewObjectForEntityForName:@"CDSectors" inManagedObjectContext:moc];
                newSector.code = [dictionary valueForKey:@"code"];
                newSector.name = [dictionary valueForKey:@"name"];
            }
            else
            {
                [newSector setValue:[dictionary valueForKey:@"code"] forKey:@"code"];
                [newSector setValue:[dictionary valueForKey:@"name"] forKey:@"name"];
            }
        }
        
        
        //CDPrimeDistribution
        NSDictionary* primesector = [item valueForKey:@"sector1"];
        
        newPrimeDistribution = [NSEntityDescription insertNewObjectForEntityForName:@"CDPrimeDistribution" inManagedObjectContext:moc];
        
        newPrimeDistribution.percentile = [primesector valueForKey:@"Percent"];
        newPrimeDistribution.forSector = newSector;
        
        
        //CDStatus
        if ([self updateOrInsert:@"CDStatus" withUniqueCode:[item valueForKey:@"status"]])
        {
            
            newStatus = [NSEntityDescription insertNewObjectForEntityForName:@"CDStatus" inManagedObjectContext:moc];
            
            newStatus.code = [item valueForKey:@"status"];
            newStatus.name = [item valueForKey:@"status"];
        }
        else
        {
            [newStatus setValue:[item valueForKey:@"status"] forKey:@"code"];
            [newStatus setValue:[item valueForKey:@"status"] forKey:@"name"];
            
        }
        
        
        //CDSubSector
        NSDictionary* subSector = [item valueForKey:@"sector2"];
        
        if ([self updateOrInsert:@"CDSubSecotr" withUniqueCode:[subSector valueForKey:@"Name"]])
        {
            
            newSubSector = [NSEntityDescription insertNewObjectForEntityForName:@"CDSubSecotr" inManagedObjectContext:moc];
            
            newSubSector.code = [subSector valueForKey:@"Name"];
            newSubSector.name = [subSector valueForKey:@"Name"];
            newSubSector.primarySector = newSector;
        }
        else
        {
            [newSubSector setValue:[subSector valueForKey:@"Name"] forKey:@"name"];
        }
        
        
       // CDSecondaryDistribution
        NSDictionary* secSector = [item valueForKey:@"sector2"];
        
        if ([self updateOrInsert:@"CDSecondaryDistribution" withUniqueCode:[secSector valueForKey:@"Percent"]])
        {
            
            newSecDistribution = [NSEntityDescription insertNewObjectForEntityForName:@"CDSecondaryDistribution" inManagedObjectContext:moc];
            newSecDistribution.percentile = [secSector valueForKey:@"Percent"];
            newSecDistribution.forSubSector = newSubSector;
        }
        else
        {
            [newSecDistribution setValue:[secSector valueForKey:@"Percent"] forKey:@"percentile"];
        }
        
        
        
       // CDTheme
        NSArray* themeArray = [item valueForKey:@"theme_namecode"];
        
        for (NSDictionary* themeDictionary in themeArray)
        {
            if ([self updateOrInsert:@"CDTheme" withUniqueCode:[themeDictionary valueForKey:@"code"]])
            {
                newTheme = [NSEntityDescription insertNewObjectForEntityForName:@"CDTheme" inManagedObjectContext:moc];
                
                
                newTheme.code = [themeDictionary valueForKey:@"code"];
                newTheme.name = [themeDictionary valueForKey:@"name"] ;
            }
            else
            {
                [newTheme setValue:[themeDictionary valueForKey:@"code"] forKey:@"code"];
                [newTheme setValue:[themeDictionary valueForKey:@"name"] forKey:@"name"];
            }
            
        }
        
        
        //CDBorrower
        if ([self updateOrInsert:@"CDBorrower" withUniqueCode:[item valueForKey:@"borrower"]])
        {
            
            newborrower =[NSEntityDescription insertNewObjectForEntityForName:@"CDBorrower" inManagedObjectContext:moc];
            
            newborrower.bName = [item valueForKey:@"borrower"];
            newborrower.code = [item valueForKey:@"borrower"];
            NSSet* borrowedProj = [newborrower valueForKey:@"borrowedProjects"];
            [newborrower setValue:borrowedProj forKey:@"borrowedProjects"];
            newborrower.fromCountry = newCountry;
        }
        else
        {
            [newborrower setValue:[item valueForKey:@"borrower"] forKey:@"bName"];
            [newborrower setValue:[item valueForKey:@"borrower"] forKey:@"code"];
        }
        
        
        //CDAgency
        if ([self updateOrInsert:@"CDAgency" withUniqueCode:[item valueForKey:@"impagency"]])
        {
            newAgency = [NSEntityDescription insertNewObjectForEntityForName:@"CDAgency" inManagedObjectContext:moc];
            
            newAgency.name = [item valueForKey:@"impagency"];
            newAgency.code = [item valueForKey:@"impagency"];
            newAgency.fromCountry = newCountry;
        }
        else
        {
            [newAgency setValue:[item valueForKey:@"impagency"] forKey:@"name"];
            [newAgency setValue:[item valueForKey:@"impagency"] forKey:@"code"];
        }
        
        if (![moc save:&error]&&[moc hasChanges])
        {
            NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
        }
        index += 1;
    }
    [[CalculateTime sharedInstance]EndTime];
    double elapsedTime = [[CalculateTime sharedInstance]CalculateTimeElapsed];
    NSLog(@"insertion Time:%f",elapsedTime);
}


- (NSMutableArray*)fetchDataFromCoreDataforEntity:(NSString*)string
{
    [[CalculateTime sharedInstance]StartTime];
    NSManagedObjectContext *context = self.managedObjectContextObj;
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:string];
    
    NSError *error = nil;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    //    for (NSManagedObject *obj in results) {
    //
    //        NSArray *keys = [[[obj entity] attributesByName] allKeys];
    //        NSDictionary *dictionary = [obj dictionaryWithValuesForKeys:keys];
    //        NSLog(@"Dictionary = %@", dictionary);
    //
    //        NSManagedObject *arr = (NSManagedObject*) obj;
    //        NSLog(@"arr = %@", arr);
    //    }
    
    if (error != nil)
    {
        NSLog(@"Error While Reading the DataBase");
    }
    else
    {
        
    }
    [[CalculateTime sharedInstance]EndTime];
    double elapsedTime = [[CalculateTime sharedInstance]CalculateTimeElapsed];
    NSLog(@"fetching Time for %@:%f",string,elapsedTime);
    return [NSMutableArray arrayWithArray:results];
}


- (NSArray *) fetchItemsForEntity:(NSString*)entityName andCode:(NSString*)code
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:self.managedObjectContextObj];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"code==%@",code];
    [request setPredicate:predicate];
    
    NSError* error = nil;
    NSArray *fetchedRecords = [self.managedObjectContextObj executeFetchRequest:request error:&error];
    
    if (fetchedRecords.count>0 )
    {
        return fetchedRecords;
    }
    return nil;
}

- (NSDate*)formatDate:(NSString*) dateString

{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *aDate = [dateFormatter dateFromString:dateString];
    
    return aDate;
    
}


#pragma mark - Core Data stack


- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.globalLogic.RealmDataBaseObjC" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RealmDataBaseObjC" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RealmDataBaseObjC.sqlite"];
    NSLog(@"%@",storeURL);
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    [_managedObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
