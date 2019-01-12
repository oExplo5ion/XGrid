//
//  ColorRowView.m
//  XGrid
//
//  Created by Mac on 1/12/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "ColorRowView.h"
#import "ColorCircleView.h"
#import "NSView+XGrid.h"

@interface ColorRowView () {
    uint8 size;
}
@end

@implementation ColorRowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        size = 40;
        [self setupUI];
    }
    return self;
}

-(void)colorSelected:(NSColor*)color {
    if (self.onColorSelected == nil) { return; }
    self.onColorSelected(color);
}

-(void)setupUI {
    NSTextField *title = [[NSTextField alloc] init];
    [self addSubview:title];
    title.translatesAutoresizingMaskIntoConstraints = false;
    [[title.topAnchor constraintEqualToAnchor:self.topAnchor constant: 0] setActive:true];
    [[title.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 5] setActive:true];
    [[title.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: -5] setActive:true];
    [title setBezeled:false];
    [title setEditable:false];
    title.stringValue = @"Line color";
    
    // TODO: Replace with collection view
    ColorCircleView *defaultCircle = [[ColorCircleView alloc] init];
    [self addSubview:defaultCircle];
    defaultCircle.translatesAutoresizingMaskIntoConstraints = false;
    [[defaultCircle.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:3] setActive:true];
    [[defaultCircle.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[defaultCircle.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:5] setActive:true];
    [[defaultCircle.widthAnchor constraintEqualToConstant:size] setActive:true];
    [defaultCircle setCurrentColor:NSColor.cyanColor];
    defaultCircle.onClick = ^(NSColor *color) {
        [self colorSelected:color];
    };
}

@end
