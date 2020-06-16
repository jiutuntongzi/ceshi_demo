//
//  ZXBaseImageView.m
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import "ZXBaseImageView.h"

@implementation ZXBaseImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled  = YES;
    }
    return self;
}

@end
