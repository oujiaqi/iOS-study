//
//  OJQItemCell.h
//  FirstApp
//
//  Created by colinou on 2017/10/23.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OJQItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *height;

@property (copy, nonatomic) void (^actionBlock) (void);

@end
