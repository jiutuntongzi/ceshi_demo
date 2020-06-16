//
//  ZXBaseCollectionReusableView.m
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import "ZXBaseCollectionReusableView.h"

@implementation ZXBaseCollectionReusableView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self renderViews];
    }
    return self;
}

- (void)renderViews{}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.cellEdgeInsets.left, frame.origin.y + self.cellEdgeInsets.top, frame.size.width - self.cellEdgeInsets.left - self.cellEdgeInsets.right, frame.size.height - self.cellEdgeInsets.top - self.cellEdgeInsets.bottom);
    [super setFrame:rc];
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib *)nib {
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)updateWithCellData:(id)aData {}

+ (CGSize)sizeForCellData:(id)aData {
    return CGSizeZero;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
