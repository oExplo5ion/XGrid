#import "NSView+Ruler.h"

@implementation NSView (Ruler)

-(void)setBackGroundColor:(NSColor*)color {
    [self setWantsLayer:TRUE];
    self.layer.backgroundColor = color.CGColor;
}

@end
