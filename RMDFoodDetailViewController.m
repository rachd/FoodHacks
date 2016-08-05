//
//  RMDFoodDetailViewController.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/31/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFoodDetailViewController.h"
#import "RMDFoodDetailView.h"

@interface RMDFoodDetailViewController ()

@end

@implementation RMDFoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RMDFoodDetailView *foodDetailView = [[RMDFoodDetailView alloc] initWithFrame:[self.view bounds]];
    self.view = foodDetailView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
