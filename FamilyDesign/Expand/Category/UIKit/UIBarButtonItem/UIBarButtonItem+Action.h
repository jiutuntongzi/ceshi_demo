//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BarButtonActionBlock)();

@interface UIBarButtonItem (Action)

/// A block that is run when the UIBarButtonItem is tapped.
//@property (nonatomic, copy) dispatch_block_t actionBlock;
- (void)setActionBlock:(BarButtonActionBlock)actionBlock;
@end
