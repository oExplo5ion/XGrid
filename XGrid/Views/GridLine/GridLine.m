#import "GridLine.h"
#import "NSView+XGrid.h"

@interface GridLine () <NSMenuDelegate> {
    NSView *line;
}

@end

@implementation GridLine

#pragma mark Ovverides
- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)layout {
    [super layout];
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
                                                                options:(NSEventTypeLeftMouseDragged | NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways)
                                                                  owner:self
                                                               userInfo:nil];
    [self addTrackingArea:trackingArea];
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

#pragma mark Mouse events
-(void)mouseEntered:(NSEvent *)event {
    __block LinesViewDirection block_direction = _scrollDirection;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block_direction == VERTICAL) {
            [[NSCursor resizeUpDownCursor] set];
            return;
        }
        [[NSCursor resizeLeftRightCursor] set];
    });
}

-(void)mouseExited:(NSEvent *)event {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSCursor arrowCursor] set];
    });
}

-(void)mouseDragged:(NSEvent *)event {
    if (self.onDraged == nil) { return; }
    self.onDraged(NSEvent.mouseLocation);
}

#pragma mark Menu
-(NSMenu *)menuForEvent:(NSEvent *)event {
    return [self getMenu];
}

-(NSMenu *)getMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    menu.delegate = self;
    NSMenuItem *removeItem = [[NSMenuItem alloc] initWithTitle:@"Remove" action:@selector(menuRemoveAction) keyEquivalent:@""];
    [menu addItem:removeItem];
    return menu;
}

-(void)menuRemoveAction {
    if (self.onMenuRemove == nil) { return; }
    self.onMenuRemove();
}

#pragma mark Menu degelate
-(void)menuWillOpen:(NSMenu *)menu {
    if (line == nil) { return; }
    [line setBackGroundColor:NSColor.redColor];
}

-(void)menuDidClose:(NSMenu *)menu {
    
}

#pragma mark UI
-(void)drawLine:(LinesViewDirection)direction color:(NSColor*_Nonnull)color {
    _scrollDirection = direction;
    
    [line removeFromSuperview];
    line = nil;
    
    line = [[NSView alloc] init];
    [self addSubview:line];
    line.translatesAutoresizingMaskIntoConstraints = false;
    [line setBackGroundColor:color];
    
    uint8 multiplier = 2;
    if (direction == VERTICAL) {
        [[line.topAnchor constraintEqualToAnchor:self.topAnchor constant: self.bounds.size.height / multiplier] setActive:true];
        [[line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant: self.bounds.size.height / multiplier] setActive:true];
        [[line.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 0] setActive:true];
        [[line.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: 0] setActive:true];
        return;
    }
    
    // HORIZONTAL
    [[line.topAnchor constraintEqualToAnchor:self.topAnchor constant: 0] setActive:true];
    [[line.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant: 0] setActive:true];
    [[line.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: self.bounds.size.width / multiplier] setActive:true];
    [[line.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: self.bounds.size.width / multiplier] setActive:true];
}

-(void)setLineColor:(NSColor *)color {
    [line setBackGroundColor:color];
}

@end
