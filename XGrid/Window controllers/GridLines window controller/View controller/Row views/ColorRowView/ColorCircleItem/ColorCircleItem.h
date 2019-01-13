//
//  ColorCircleItem.h
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ColorCircleItem : NSCollectionViewItem

-(void)setCurrentColor:(NSColor*)color;

@property (nonatomic, copy) void (^onColorPicked)(NSColor*);

@end
