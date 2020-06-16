//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//
//https://github.com/hcbarry/MiddleAlignedButton

#import <UIKit/UIKit.h>

/**
 A category on UIButton that provides a simple yet powerful interface to middle aligning imageView and titleLabel
 */
@interface UIButton (MiddleAligning)

/**
 @param spacing The middle spacing between imageView and titleLabel.
 @discussion The middle aligning method for imageView and titleLabel.
 */
- (void)middleAlignButtonWithSpacing:(CGFloat)spacing;

@end
