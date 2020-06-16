//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.

#import <UIKit/UIKit.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

/**
 Category on `CAShapeLayer`, that allows setting and getting UIBezierPath on CAShapeLayer.
 */
@interface CAShapeLayer (UIBezierPath)

/**
 Update CAShapeLayer with UIBezierPath.
 */
- (void)dt_updateWithBezierPath:(UIBezierPath *)path;

/**
 Get UIBezierPath object, constructed from CAShapeLayer.
 */
- (UIBezierPath*)dt_bezierPath;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
