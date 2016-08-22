//
//  RMDFoodDetailViewController.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/31/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFoodDetailViewController.h"
#import "RMDFoodList.h"

@interface RMDFoodDetailViewController ()

@property (nonatomic, strong) RMDFood *food;
@property (nonatomic, strong) RMDFoodDetailView *foodDetailView;

@end

@implementation RMDFoodDetailViewController

- (instancetype)initWithFood:(RMDFood *)food {
    self = [super init];
    if (self) {
        self.food = food;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.foodDetailView = [[RMDFoodDetailView alloc] initWithFrame:[self.view bounds] food:self.food];
    self.view = self.foodDetailView;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.food.name = self.foodDetailView.foodNameField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
