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

+(LinesSettings*_Nullable)fromJSON:(NSArray*_Nonnull)json {
    NSDictionary *dict = json[0];
    if (dict == nil) { return nil; }
    NSArray *color = [dict objectForKey:@"color"];
    int r = [color[0] intValue];
    int g = [color[1] intValue];
    int b = [color[2] intValue];
    NSColor *sColor = [NSColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
    CGFloat sWidth = [[dict objectForKey:@"width"] floatValue];
    
    LinesSettings *settings = [[LinesSettings alloc] init];
    [settings setColor:sColor];
    [settings setWidth:sWidth];
    return settings;
}

@end
