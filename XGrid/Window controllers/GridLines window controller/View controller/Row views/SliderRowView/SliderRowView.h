//
//  SliderRowView.h
//  XGrid
//
//  Created by Mac on 1/5/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SliderRowView : NSView

@property (nonatomic, copy) void (^onSliderChange)(int);

-(void)setSliderValue:(uint8)value;

@end
