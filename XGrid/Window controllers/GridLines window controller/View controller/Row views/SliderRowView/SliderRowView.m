//
//  SliderRowView.m
//  XGrid
//
//  Created by Mac on 1/5/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "SliderRowView.h"

@interface SliderRowView () {
    NSTextField *valueLabel;
    NSSlider *slider;
}

@end

@implementation SliderRowView

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
}

-(void)sliderValueChanged:(NSSlider *)slider {
    valueLabel.stringValue = [[NSString alloc] initWithFormat:@"%d", slider.integerValue];
}

-(void)setSliderValue:(uint8)value {
    slider.integerValue = value;
}

-(void)setupUI {
    NSTextField *title = [[NSTextField alloc] init];
    [self addSubview:title];
    title.translatesAutoresizingMaskIntoConstraints = false;
    [[title.topAnchor constraintEqualToAnchor:self.topAnchor constant: 5] setActive:true];
    [[title.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 5] setActive:true];
    [[title.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: -5] setActive:true];
    [title setBezeled:false];
    [title setEditable:false];
    title.stringValue = @"Line width";
    
    valueLabel = [[NSTextField alloc] init];
    [self addSubview:valueLabel];
    valueLabel.translatesAutoresizingMaskIntoConstraints = false;
    [[valueLabel.topAnchor constraintEqualToAnchor:title.bottomAnchor constant: 3] setActive:true];
    [[valueLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: -5] setActive:true];
    [valueLabel setBezeled: false];
    [valueLabel setEditable: false];
    valueLabel.stringValue = @"0";
    
    slider = [[NSSlider alloc] init];
    [self addSubview:slider];
    slider.translatesAutoresizingMaskIntoConstraints = false;
    [[slider.topAnchor constraintEqualToAnchor:title.bottomAnchor constant: 5] setActive:true];
    [[slider.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 5] setActive:true];
    [[slider.rightAnchor constraintEqualToAnchor:valueLabel.leftAnchor constant: -5] setActive:true];
    slider.minValue = 1.0f;
    slider.maxValue = 5.0f;
    slider.target = self;
    slider.action = @selector(sliderValueChanged:);
}

@end
