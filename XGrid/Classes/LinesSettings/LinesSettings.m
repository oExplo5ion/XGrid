//
//  LinesSettings.m
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "LinesSettings.h"

@implementation LinesSettings

- (instancetype)init
{
    self = [super init];
    if (self) {
        _width = 3;
        _color = NSColor.cyanColor;
    }
    return self;
}

@end
