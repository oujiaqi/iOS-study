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
    @throw[NSException exceptionWithName:@"Singleton" reason:@"Use+[OJQImageStore sharedStore]" userInfo:nil];
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
    self.dictionary[key] = image;
    NSString *imagePath = [self imagePathForKey:key];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key {
//    return [self.dictionary objectForKey:key];
//    return self.dictionary[key];
    UIImage *result = self.dictionary[key];
    if (!result){
        NSString *imagePath = [self imagePathForKey:key];
        result = [UIImage imageWithContentsOfFile:imagePath];
        if (result) {
            self.dictionary[key] = result;
        } else {
            NSLog(@"Error: unable to find %@", [self imagePathForKey:key]);
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

- (NSString *)imagePathForKey:(NSString *)key {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}


@end
