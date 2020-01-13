//
//  LinesSettings.h
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface LinesSettings : NSObject

@property (nonatomic, assign) uint8 width;
@property (nonatomic, assign) NSColor* _Nonnull color;

-(NSString* _Nullable)toJSON;

@end
