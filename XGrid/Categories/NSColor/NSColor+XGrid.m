#import "NSColor+XGrid.h"

@implementation NSColor (XGrid)

+ (NSColor *)midNightBlue {
    return [NSColor colorWithRed:44/255 green:62/255 blue:80/255 alpha:1.0f];
}

+ (NSColor *)clouds {
    return [NSColor colorWithRed:236%255 green:240%255 blue:241%255 alpha:1];
}

-(NSArray *)rgbValue {
    return [NSArray arrayWithObjects:
            [NSNumber numberWithFloat:self.redComponent * 255],
            [NSNumber numberWithFloat:self.greenComponent * 255],
            [NSNumber numberWithFloat:self.blueComponent * 255]
            , nil];
}

@end
