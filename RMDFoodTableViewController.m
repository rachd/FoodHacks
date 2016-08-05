//
//  RMDFoodTableViewController.m
//  FoodHacks
//
//  Created by Rachel Dorn on 5/29/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDFoodTableViewController.h"
#import "RMDFoodDetailViewController.h"
#import "RMDFoodList.h"
#import "RMDFood.h"

@interface RMDFoodTableViewController ()

@end

@implementation RMDFoodTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"My Food List";
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFood:)];
        self.navigationItem.rightBarButtonItem = addButton;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addFood:(RMDFood *)food {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[RMDFoodList sharedStore] allFoods] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.text = [[[[RMDFoodList sharedStore] allFoods] objectAtIndex:indexPath.row] name];
        cell.detailTextLabel.text = @"hello";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSArray *foodList = [[RMDFoodList sharedStore] allFoods];
//        RMDFood *food = foodList[indexPath.row];
//        [[RMDFoodList sharedStore] removeFood:food];
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RMDFoodDetailViewController *foodDetailVC = [[RMDFoodDetailViewController alloc] init];
    [self.navigationController pushViewController:foodDetailVC animated:YES];
}

@end
