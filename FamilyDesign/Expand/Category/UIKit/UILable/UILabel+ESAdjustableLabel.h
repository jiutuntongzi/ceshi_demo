//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ESAdjustableLabel)

// General method. If minSize is set to CGSizeZero then
// it is ignored
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize 
                     minimumSize:(CGSize)minSize 
                 minimumFontSize:(int)minFontSize;

// Adjust label using only the maximum size and the 
// font size as constraints
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize 
                 minimumFontSize:(int)minFontSize;

// Adjust the size of the label using only the font
// size as a constraint (the maximum size will be
// calculated automatically based on the screen size)
// =====================================================
- (void)adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

// Adjust label without any constraints (the maximum 
// size will be calculated automatically based on the
// screen size)
// =====================================================
- (void)adjustLabel;

@end
