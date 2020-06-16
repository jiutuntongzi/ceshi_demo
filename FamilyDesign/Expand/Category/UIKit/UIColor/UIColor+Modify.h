//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIColor (Modify)
- (UIColor *)invertedColor;
- (UIColor *)colorForTranslucency;
- (UIColor *)lightenColor:(CGFloat)lighten;
- (UIColor *)darkenColor:(CGFloat)darken;
@end
