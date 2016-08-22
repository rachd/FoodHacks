//
//  RMDFoodList.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFoodList.h"
#import "RMDFood.h"

@interface RMDFoodList ()

@property (nonatomic, strong) NSMutableArray *allFoodsPrivate;

@end

@implementation RMDFoodList

+ (instancetype)sharedStore {
    static RMDFoodList *sharedStore;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (RMDFood *)createFood:(NSString *)name {
    RMDFood *food = [[RMDFood alloc] initWithName:name];
    [self.allFoodsPrivate addObject:food];
    return food;
}

- (NSArray *)allFoods {
    return [self.allFoodsPrivate copy];
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        self.allFoodsPrivate = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            RMDFood *food = [[RMDFood alloc] initWithName:@"potato"];
            [self.allFoodsPrivate addObject:food];
        }
    }
    return self;
}

- (void)removeFood:(RMDFood *)food {
    [self.allFoodsPrivate removeObjectIdenticalTo:food];
}

@end
