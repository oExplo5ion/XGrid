#import "GridLine.h"
#import "NSView+XGrid.h"

@implementation GridLine

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setupUI];
    }
    return self;
}

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

-(void)setupUI {
    [self setBackGroundColor:NSColor.cyanColor];
}

@end
