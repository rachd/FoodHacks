//
//  RMDFoodDetailView.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/31/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFoodDetailView.h"

@interface RMDFoodDetailView ()

@property (nonatomic, strong) RMDFood *food;

@end

@implementation RMDFoodDetailView

- (instancetype)initWithFrame:(CGRect)frame food:(RMDFood *)food {
    self = [super initWithFrame:frame];
    if (self) {
        self.food = food;
        [self setUpNameLabel];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpNameLabel {
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.frame.size.height / 8, self.frame.size.width / 2 - 20, 40)];
    nameLabel.text = @"Name of Food: ";
    [self addSubview:nameLabel];
    
    self.foodNameField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 + 10, self.frame.size.height / 8, self.frame.size.width / 2 - 20, 40)];
    self.foodNameField.text = self.food.name;
    [self addSubview:self.foodNameField];
}

@end
