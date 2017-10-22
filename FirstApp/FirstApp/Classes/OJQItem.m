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
    
    // 创建保存图片的键值
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    newItem.itemKey = key;
    return newItem;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ %@ %@", _name, _age, _height];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.height forKey:@"height"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _height = [aDecoder decodeObjectForKey:@"height"];
        _age = [aDecoder decodeObjectForKey:@"age"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
    }
    return self;
}



@end
