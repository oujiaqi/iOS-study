//
//  OJQImageStore.m
//  FirstApp
//
//  Created by colinou on 2017/9/28.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQImageStore.h"

@interface OJQImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation OJQImageStore

+ (instancetype) sharedStore {
    static OJQImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init {
    @throw[NSException exceptionWithName:@"Singleton" reason:@"Use+[OJWImageStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) setImage:(UIImage *)image forKey:(NSString *)key {
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key {
//    return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}


@end
