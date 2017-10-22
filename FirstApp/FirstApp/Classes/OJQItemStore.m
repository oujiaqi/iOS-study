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
//        _privateItems = [[NSMutableArray alloc] init];
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (! _privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
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

- (NSString *)itemArchivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    for (NSString *i in documentDirectories) {
        NSLog(@"%@", i);
    }
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges {
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

@end




