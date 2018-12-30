#import "NSView+XGrid.h"

@implementation NSView (XGrid)

-(void)setBackGroundColor:(NSColor*)color {
    [self setWantsLayer:TRUE];
    self.layer.backgroundColor = color.CGColor;
}

@end
