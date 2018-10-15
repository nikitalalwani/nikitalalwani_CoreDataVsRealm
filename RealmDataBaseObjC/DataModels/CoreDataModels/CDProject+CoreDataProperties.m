//
//  CDProject+CoreDataProperties.m
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDProject+CoreDataProperties.h"

@implementation CDProject (CoreDataProperties)





+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"CDProject" inManagedObjectContext:moc]];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"code == %@", [item valueForKey:@"code"]];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    if(results == nil || results.count ==0)
    {
        
        CDProject *project = [NSEntityDescription insertNewObjectForEntityForName:@"CDProject" inManagedObjectContext:moc];
        [project setValue:[item valueForKey:BOARD_APPROVAL_MONTH] forKey:@"boardApprovedMonth"];
        [project setValue:[item valueForKey:CODE_KEY] forKey:CODE_KEY];
        [project setValue:[item valueForKey:NAME] forKey:NAME];
        [project setValue:[item valueForKey:REGION_NAME] forKey:REGION];
        [project setValue:[item valueForKey:CLOSING_DATE] forKey:@"closingDate"];
        
        
        NSError *error = nil;
        // Save the object to persistent store
//        if (![moc save:&error]) {
//            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//        }
        return self;
    }
    return [results firstObject];
}



@end
