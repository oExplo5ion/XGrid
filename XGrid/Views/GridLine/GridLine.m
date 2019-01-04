#import "GridLine.h"
#import "NSView+XGrid.h"

@implementation GridLine

#pragma mark Ovverides
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

#pragma mark Menu
-(NSMenu *)menuForEvent:(NSEvent *)event {
    return [self getMenu];
}

-(NSMenu *)getMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    NSMenuItem *removeItem = [[NSMenuItem alloc] initWithTitle:@"Remove" action:@selector(menuRemoveAction) keyEquivalent:@""];
    [menu addItem:removeItem];
    return menu;
}

-(void)menuRemoveAction {
    if (self.onMenuRemove == nil) { return; }
    self.onMenuRemove();
}

#pragma mark UI
-(void)setupUI {
    [self setBackGroundColor:NSColor.cyanColor];
}

@end
