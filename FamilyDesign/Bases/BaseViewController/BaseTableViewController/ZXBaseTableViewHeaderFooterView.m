//
//  ZXBaseTableViewHeaderFooterView.m
//  ZXBaseView_Example
//
//  Created by lyc on 2018/3/15.
//  Copyright © 2018年 lyc. All rights reserved.
//

#import "ZXBaseTableViewHeaderFooterView.h"

@implementation ZXBaseTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {}

- (void)setFrame:(CGRect)frame {
    CGRect rc = CGRectMake(frame.origin.x + self.viewEdgeInsets.left, frame.origin.y + self.viewEdgeInsets.top, frame.size.width - self.viewEdgeInsets.left - self.viewEdgeInsets.right, frame.size.height - self.viewEdgeInsets.top - self.viewEdgeInsets.bottom);
    [super setFrame:rc];
}

+ (UINib *)nib {
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)updateWithCellData:(id)aData {}

+ (CGFloat)heightForCellData:(id)aData {
    return 0;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
