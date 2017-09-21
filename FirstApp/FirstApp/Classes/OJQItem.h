//
//  OJQItem.h
//  FirstApp
//
//  Created by ouou on 2017/9/17.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OJQItem : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* age;
@property (nonatomic) NSString* height;

+ (OJQItem *) randomItem;

@end