//
//  RealmManager.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "RealmManager.h"

@interface RealmManager()
@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong)  RLMResults *result;

@end

@implementation RealmManager

-(NSMutableArray*)getAllProjects{

    return nil;
}

-(NSMutableArray*)getAllThemes{
    
    return nil;
}
-(NSMutableArray*)getAllCountries{
    
    return nil;
}
-(NSMutableArray*)getAllSectors{
    
    return nil;
}

-(NSMutableArray*)getAllBorrowers{
    
    return nil;
}

-(id)initDatabaseManager{
    
    self = [super initDatabaseManager];
    if(self)
    {
        // initialise Realm here
        self.realm = [RLMRealm defaultRealm];
    }
    
    [self insertAllDefaultData];
    return self;
}



-(void)insertAllDefaultData{
    
    NSMutableArray *arrayOfData = [NSMutableArray new];
    
    //dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
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
            [self addDataToRealm:arrayOfData];
            ;
        }
    }//);
}

-(void)addDataToRealm:(NSMutableArray*)dataArray
{
    NSUInteger index = 0;
    
    [self.realm beginWriteTransaction];
    for (NSDictionary *item in dataArray)
    {
        NSLog([NSString stringWithFormat:@"index = %lu",index]);
        
        
        RMCountry * country = [RMCountry InsertOrUpdateInDefaultRealmWithValue:item];
        RMBorrower *borrower = [RMBorrower InsertOrUpdateInDefaultRealmWithValue:item];
        //borrower.fromCountry = country;
        
        
        RMProject *project = [RMProject InsertOrUpdateInDefaultRealmWithValue:item withIndex:index];
        project.borrower = borrower;
        [country.allProjects addObject:project];
        
        
        NSArray *docs = [item valueForKey:@"projectdocs"];
        for(NSDictionary *docItem in docs)
        {
            RMDocType *docType = [RMDocType InsertOrUpdateInDefaultRealmWithValue:docItem];
            RMProjectDocs *document = [RMProjectDocs InsertOrUpdateInDefaultRealmWithValue:docItem];
            document.docType = docType;
            
            
            [project.allDocs addObject:document];
        }
        
        NSArray *sectors = [item valueForKey:@"mjsector_namecode"];
        for(NSDictionary *sector in sectors)
        {
            RMSectors *primeSector = [RMSectors InsertOrUpdateInDefaultRealmWithValue:sector];
            
            //            NSArray *primeDistribution = [item valueForKey:@"majorsector_percent"];
            //            for(NSDictionary *distribution in primeDistribution)
            //            {
            //                RMSectors *primeSector = [RMSectors InsertOrUpdateInDefaultRealmWithValue:distribution];
            //                [project.allSectors addObject:primeSector];
            //            }
            
            [project.allSectors addObject:primeSector];
        }
        
        index += 1;
    }
    [self.realm commitWriteTransaction];
    
    
    
}


- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.globalLogic.RealmDataBaseObjC" in the application's documents directory.
    //NSLog([[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] path]);
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}




-(NSArray<DMProject*>*)getAllProjectsList{
    
    self.result = [RMProject allObjects];
    
    NSMutableArray<DMProject*> *projectsArray = [NSMutableArray new];
    
    
    
    for(RMProject *project in self.result)
    {
        DMProject *projectObject = [DMProject new];
        projectObject.name = project.name;
        projectObject.code = project.code;
        projectObject.borrowerName = project.borrower.bName;
        projectObject.countryName = project.borrower.fromCountry.countryName;
        
        [projectsArray addObject:projectObject];
    }
    return [projectsArray copy];
}

@end
