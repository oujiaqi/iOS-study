//
//  OJQItemCell.m
//  FirstApp
//
//  Created by colinou on 2017/10/23.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQItemCell.h"

@implementation OJQItemCell

- (IBAction)showImage:(id)sender {
    // 调用Block对象之前检查Block对象是否存在
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end
