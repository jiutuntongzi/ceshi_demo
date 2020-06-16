//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.

#import <UIKit/UIKit.h>

@interface UITextField (History)

/**
 *  identity of this textfield
 */
@property (retain, nonatomic) NSString* identify;

/**
 *  load textfiled input history
 *
 *  @param identify identity of this textfield
 *
 *  @return the history of it's input
 */
- (NSArray*) loadHistroy;

/**
 *  save current input text
 */
- (void) synchronize;

- (void) showHistory;
- (void) hideHistroy;

- (void) clearHistory;

@end
