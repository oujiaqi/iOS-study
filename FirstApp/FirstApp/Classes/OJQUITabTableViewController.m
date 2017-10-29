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
#import "OJQDetialViewController.h"

#import "OJQItemCell.h"


@interface OJQUITabTableViewController ()

@end

@implementation OJQUITabTableViewController

- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:<#animated#>];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OJQDetialViewController *detialVC = [[OJQDetialViewController alloc] init];
    NSArray *items = [[OJQItemStore sharedStore] allItems];
    OJQItem *selectedItem = items[indexPath.row];
    
    detialVC.item = selectedItem;
    [self.navigationController pushViewController:detialVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UINib *nib = [UINib nibWithNibName:@"OJQItemCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OJQItemCell"];
    
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
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Main";
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = bbi;
    }
    return self;
}

- (void) addNewItem: (OJQItem*) nItem {
    [[OJQItemStore sharedStore] createItem];
    [self.tableView reloadData];
    
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
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    
//    NSArray *items = [[OJQItemStore sharedStore] allItems];
//    OJQItem *item = items[indexPath.row];
//    cell.textLabel.text = [item description];
//    return cell;
    
    OJQItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OJQItemCell" forIndexPath:indexPath];
    NSArray *items = [[OJQItemStore sharedStore] allItems];
    OJQItem *item = items[indexPath.row];
    cell.name.text = item.name;
    cell.height.text = item.height;
    cell.age.text = item.age;
    cell.imageView.image = [UIImage imageNamed: @"flickr.png"];
    cell.actionBlock = ^{
        NSLog(@"Going to show image for %@", item);
    };
    return cell;
}

@end
