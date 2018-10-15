//
//  CDBorrower+CoreDataProperties.m
//  
//
//  Created by Globallogic on 07/06/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDBorrower+CoreDataProperties.h"

@implementation CDBorrower (CoreDataProperties)

@dynamic bName;
@dynamic code;
@dynamic borrowedProjects;
@dynamic fromCountry;


+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"CDBorrower" inManagedObjectContext:moc]];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bName == %@", [item valueForKey:B_NAME_KEY]];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    if(results == nil || results.count ==0)
    {
        
        CDBorrower *borrower = [NSEntityDescription insertNewObjectForEntityForName:@"CDBorrower" inManagedObjectContext:moc];
        [borrower setValue:[item valueForKey:B_NAME_KEY] forKey:B_NAME_KEY];
        [borrower setValue:[item valueForKey:CODE_KEY] forKey:CODE_KEY];
        
        
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
