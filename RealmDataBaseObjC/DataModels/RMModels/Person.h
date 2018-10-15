//
//  Person.h
//  DB_OverView
//
//  Created by Globallogic on 09/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject

@property NSString *name;
@property NSString *personID;
@property NSDate   *birthday;

@end
