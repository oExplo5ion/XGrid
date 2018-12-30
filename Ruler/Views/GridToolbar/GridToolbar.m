#import "GridToolbar.h"
#import "NSView+Ruler.h"
#import "NSColor+Ruler.h"

@implementation GridToolbar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (void)setupUI {
    [self setBackGroundColor:NSColor.midNightBlue];
}

@end
