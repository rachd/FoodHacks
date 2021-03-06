//
//  RMDFoodList.h
//  FoodHacks
//
//  Created by Rachel Dorn on 5/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RMDFood;

@interface RMDFoodList : NSObject

@property (nonatomic, readonly, copy) NSArray *allFoods;

+ (instancetype)sharedStore;
- (RMDFood *)createFood:(NSString *)name;
- (void)removeFood:(RMDFood *)food;

@end
