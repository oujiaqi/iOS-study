//
//  OJQImageStore.h
//  FirstApp
//
//  Created by colinou on 2017/9/28.
//  Copyright © 2017年 ouou. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface OJQImageStore : NSObject

+ (instancetype)sharedStore;
- (void) setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
