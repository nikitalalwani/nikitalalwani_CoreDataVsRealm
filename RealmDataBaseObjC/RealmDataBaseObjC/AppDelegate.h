//
//  AppDelegate.h
//  RealmDataBaseObjC
//
//  Created by GlobalLogic on 15/04/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong,nonatomic)NSMutableArray *arrayOfData;

-(void) getData;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

