//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
#import "CALayer+UIColor.h"

@implementation CALayer (UIColor)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

-(void)setContentsUIImage:(UIImage*)bgImage{
    self.contents=(__bridge id)(bgImage.CGImage);
}
-(UIImage*)contentsUIImage{
    return self.contents;
}
@end
