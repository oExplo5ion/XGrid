//
//  ColorCircleView.m
//  XGrid
//
//  Created by Mac on 1/12/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "ColorCircleView.h"
#import "NSView+XGrid.h"

@interface ColorCircleView () {
    NSColor *currentColor;
    NSView  *colorView;
}
@end

@implementation ColorCircleView

-(BOOL)acceptsFirstResponder {
    return true;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    self.layer.borderWidth  = 2.0f;
    self.layer.borderColor  = NSColor.lightGrayColor.CGColor;
    self.layer.cornerRadius = dirtyRect.size.height / 2;
}

-(void)mouseUp:(NSEvent *)event {
    if (self.onClick == nil) { return; }
    self.onClick(currentColor);
}

-(void)mouseDown:(NSEvent *)event {
    
}

-(void)setCurrentColor:(NSColor *)color {
    if (colorView == nil || colorView.superview == nil) { return; }
    [colorView setBackGroundColor:color];
}

-(void)setupUI {
    [self setWantsLayer:false];
    
    colorView = [[NSView alloc] init];
    [self addSubview:colorView];
    colorView.translatesAutoresizingMaskIntoConstraints = false;
    [[colorView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:true];
    [[colorView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[colorView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[colorView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
}

@end
