//
//  OJQItemStore.h
//  FirstApp
//
//  Created by ouou on 2017/9/17.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OJQItem;

@interface OJQItemStore : NSObject
@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedStore;
- (OJQItem *) createItem;

- (BOOL)saveChanges;

@end
