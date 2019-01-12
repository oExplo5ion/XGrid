//
//  ColorRowView.h
//  XGrid
//
//  Created by Mac on 1/12/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ColorRowView : NSView

@property (nonatomic, copy) void (^onColorSelected)(NSColor*);

@end
