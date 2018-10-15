//
//  CDCountry.m
//  
//
//  Created by Globallogic on 05/06/16.
//
//

#import "CDCountry.h"
#import "CDProject.h"

@implementation CDCountry

@dynamic code;
@dynamic countryName;
@dynamic displayName;
@dynamic allAgencies;
@dynamic allBorrowers;
@dynamic allProjects;


+(id)insertOrUpdateItem:(NSDictionary*)item withManagedContext:(NSManagedObjectContext*)moc{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"CDCountry" inManagedObjectContext:moc]];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"code == %@", [item valueForKey:COUNTRY_CODE]];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    if(results == nil || results.count ==0)
    {
        
        CDCountry *country = [NSEntityDescription insertNewObjectForEntityForName:@"CDCountry" inManagedObjectContext:moc];
        [country setValue:[item valueForKey:COUNTRY_CODE] forKey:CODE_KEY];
        [country setValue:[item valueForKey:COUNTRY_NAME] forKey:COUNTRY_NAME_KEY];
        [country setValue:[item valueForKey:COUNTRY_SHORT_NAME] forKey:COUNTRY_DISPLAY_NAME];
        
        
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
