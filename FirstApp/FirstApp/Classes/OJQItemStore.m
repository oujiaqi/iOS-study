//
//  OJQItemStore.m
//  FirstApp
//
//  Created by ouou on 2017/9/17.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQItemStore.h"
#import "OJQItem.h"


@interface OJQItemStore ()
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation OJQItemStore

+ (instancetype) sharedStore {
    static OJQItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[OJQItemStore sharedStore" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems {
//    return [self.privateItems copy];
    return self.privateItems;
}

- (OJQItem *) createItem {
    OJQItem *item = [OJQItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end




