//
//  RMDFood.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFood.h"

@implementation RMDFood

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

@end
