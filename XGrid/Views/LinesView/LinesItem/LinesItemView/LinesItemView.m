#import "LinesItemView.h"
#import "NSView+XGrid.h"
#import "NSColor+XGrid.h"

@implementation LinesItemView

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
    [self setBackGroundColor:NSColor.clearColor];
    
    NSView *line = [[NSView alloc] init];
    [self addSubview:line];
    line.translatesAutoresizingMaskIntoConstraints = false;
    [[line.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:true];
    [[line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[line.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 0] setActive:true];
    [[line.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: 0] setActive:true];
    [line setBackGroundColor:NSColor.darkGrayColor];
}

@end
