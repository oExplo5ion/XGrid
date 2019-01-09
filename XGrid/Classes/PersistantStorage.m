//
//  PersistantStorage.m
//  XGrid
//
//  Created by Mac on 1/6/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "PersistantStorage.h"

@implementation PersistantStorage

+ (void)setLineSize:(uint8)lineSize {
    [[NSUserDefaults standardUserDefaults] setInteger:lineSize forKey:@"lineSize"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (uint8)lineSize {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"lineSize"];
}

@end
