//
//  OJQItem.m
//  FirstApp
//
//  Created by ouou on 2017/9/17.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQItem.h"

@implementation OJQItem
+ (OJQItem *) randomItem {
    NSArray *names = @[@"oujiaqi", @"tuqiuwen", @"linyuxin", @"lijunjie"];
    NSArray *ages = @[@"12",@"13",@"14",@"15"];
    NSArray *heights = @[@"1.5",@"1.6",@"1.7",@"1.8"];
    int randomIndex = arc4random() %4;
    OJQItem *newItem = [[OJQItem alloc] init];
    newItem.name = names[randomIndex];
    randomIndex = arc4random() %4;
    newItem.age = ages[randomIndex];
    randomIndex = arc4random() %4;
    newItem.height = heights[randomIndex];
    return newItem;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ %@ %@", _name, _age, _height];
}

@end
