//
//  FamilyDesign
//
//  Created by lyc on 2020/5/18.
//  Copyright © 2020 知行. All rights reserved.
//

#import "UIApplication+NetworkActivityIndicator.h"

#import <libkern/OSAtomic.h>

@implementation UIApplication (NetworkActivityIndicator)

static volatile int32_t numberOfActiveNetworkConnections;

#pragma mark Public API

- (void)beganNetworkActivity
{
	self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnections) > 0;
}

- (void)endedNetworkActivity
{
	self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnections) > 0;
}

@end
