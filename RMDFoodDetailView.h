//
//  RMDFoodDetailView.h
//  FoodHacks
//
//  Created by Rachel Dorn on 5/31/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDFood.h"
#import "RMDFoodDetailViewController.h"

@interface RMDFoodDetailView : UIView

@property (nonatomic, strong) UITextField *foodNameField;

- (instancetype)initWithFrame:(CGRect)frame food:(RMDFood *)food;

@end
