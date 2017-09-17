//
//  OJQUITabTableViewController.m
//  FirstApp
//
//  Created by ouou on 2017/9/17.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQUITabTableViewController.h"
#import "OJQItemStore.h"
#import "OJQItem.h"

@interface OJQUITabTableViewController ()

@end

@implementation OJQUITabTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype) init {
    self = [super initWithStyle:UITableViewStylePlain];
    self.tabBarItem.title = @"More";
    UIImage *i = [UIImage imageNamed: @"flickr.png"];
    self.tabBarItem.image = i;
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[OJQItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[OJQItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[OJQItemStore sharedStore] allItems];
    OJQItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
    
}

@end
