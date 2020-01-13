//
//  LinesSettings.m
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "LinesSettings.h"
#import "NSColor+XGrid.h"

@implementation LinesSettings

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.width = 3;
        self.color = NSColor.cyanColor;
    }
    return self;
}

-(NSString* _Nullable)toJSON {
    NSDictionary *dict =
    @{
        @"color"    : [self.color rgbValue],
        @"width"    : [NSNumber numberWithFloat:self.width]
    };
    
    NSArray *dataArr = [NSArray arrayWithObject:dict];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataArr options:NSJSONWritingPrettyPrinted error:nil];

    if (error != nil) { return nil; }

    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
