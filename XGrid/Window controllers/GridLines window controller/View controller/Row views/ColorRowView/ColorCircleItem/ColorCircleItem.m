//
//  ColorCircleItem.m
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "ColorCircleItem.h"
#import "ColorCircleView.h"

@interface ColorCircleItem () {
    ColorCircleView *colorView;
}
@end

@implementation ColorCircleItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setCurrentColor:(NSColor *)color {
    [colorView setCurrentColor:color];
}

- (void)setupUI {
    colorView = [[ColorCircleView alloc] init];
    __block ColorCircleItem *this = self;
    colorView.onClick = ^(NSColor *color) {
        if (this.onColorPicked == nil) { return; }
        this.onColorPicked(color);
    };
    self.view = colorView;
}

@end
