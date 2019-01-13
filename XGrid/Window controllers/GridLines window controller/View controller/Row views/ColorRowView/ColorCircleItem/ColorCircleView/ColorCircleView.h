//
//  ColorCircleView.h
//  XGrid
//
//  Created by Mac on 1/12/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ColorCircleView : NSView

/**
 * Set current color of self's color view
 */
-(void)setCurrentColor:(NSColor*)color;

/**
 * Gets called when user clicked on self
 */
@property (nonatomic, copy) void (^onClick)(NSColor*);

@end
