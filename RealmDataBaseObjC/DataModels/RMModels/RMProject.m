//
//  RMProject.m
//  DB_OverView
//
//  Created by Globallogic on 08/06/16.
//  Copyright © 2016 Globallogic. All rights reserved.
//

#import "RMProject.h"

@implementation RMProject

+ (NSString *)primaryKey {
    return @"code";
}

+ (instancetype)InsertOrUpdateInDefaultRealmWithValue:(NSDictionary*)item withIndex:(NSInteger)index{
    
    NSString *str = [NSString stringWithFormat:@"%@%lu",[item objectForKey:@"id"],index];
    NSMutableDictionary *data = [NSMutableDictionary new];
    [data setValue:str forKey:@"code"];
    [data setValue:[NSNumber numberWithInteger:[[item objectForKey:@"idacommamt"] integerValue]] forKey:@"grantAmmount"];
    [data setValue:[item objectForKey:@"project_name"] forKey:@"name"];
    [data setValue:[item objectForKey:@"board_approval_month"] forKey:@"boardApprovedMonth"];
    [data setValue:[NSDate new ] forKey:@"boardApprovedDate"];
    [data setValue:[NSNumber numberWithInteger:[[item objectForKey:@"ibrdcommamt"] integerValue]] forKey:@"ibrdAmmount"];
    [data setValue:[NSNumber numberWithInteger:[[item objectForKey:@"totalammount"] integerValue]] forKey:@"totalammount"];
    [data setValue:[NSString stringWithFormat:@"%@",[item objectForKey:@"approvalfy"]] forKey:@"verify"];
    [data setValue:[item objectForKey:@"envassesmentcategorycode"] forKey:@"envassesmentcategorycode"];
    [data setValue:[item objectForKey:@"lendinginstr"] forKey:@"lendinginstr"];
    
    return [RMProject createOrUpdateInDefaultRealmWithValue:data];
}



@end
