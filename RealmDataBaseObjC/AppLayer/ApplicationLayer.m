//
//  ApplicationLayer.m
//  RealmDataBaseObjC
//
//  Created by Globallogic on 04/06/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "ApplicationLayer.h"


@interface ApplicationLayer()

@property(nonatomic, strong)APPController *controller;

@end

@implementation ApplicationLayer



static ApplicationLayer *sharedAppLayer = nil;


+ (id)sharedInstance {
    
    
    if(sharedAppLayer == nil)
    {
        sharedAppLayer = [[self alloc] initWithDefaultLayer];
    }
    
    return sharedAppLayer;
}




- (id)initWithDefaultLayer
{
    self = [self init];
    if(self)
    {
        self.controller = [APPController sharedInstance];
    }
    return self;
}


- (ProjectListVm*)getprojectListVmWithdelegate:(id<ProjectListVmDelegate>)aDelegate  {
    
    return [[ProjectListVm alloc] initWithController:self.controller withDelegate:aDelegate];
}


@end
