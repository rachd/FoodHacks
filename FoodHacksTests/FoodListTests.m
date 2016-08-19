//
//  FoodListTests.m
//  FoodHacks
//
//  Created by Rachel Dorn on 8/3/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RMDFoodList.h"

@interface FoodListTests : XCTestCase

@end

@implementation FoodListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreateFood {
    int initial = [RMDFoodList sharedStore].allFoods.count;
    [[RMDFoodList sharedStore] createFood:@"testFood"];
    XCTAssertEqual([RMDFoodList sharedStore].allFoods.count, initial + 1);
}

- (void)testRemoveFood {
    RMDFoodList *foodList = [RMDFoodList sharedStore];
    RMDFood *food = [[RMDFoodList sharedStore] createFood:@"testFood"];
    int initial = foodList.allFoods.count;
    [foodList removeFood:food];
    XCTAssertEqual(foodList.allFoods.count, initial - 1);
}

@end
