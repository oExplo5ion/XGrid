#import "MainViewController.h"
#import "NSView+XGrid.h"
#import "NSColor+XGrid.h"
#import "LinesView.h"
#import "GridToolbar.h"
#import "GridLine.h"
#import "GridLinesPreferences.h"
#import "LinesSettings.h"

@interface MainViewController () {
    LinesSettings *linesSettings;
    NSView *templateView;
    CGSize voidSize;
    NSMutableSet *gridLines;
    uint8 linesWidth;
}
@property GridToolbar *gridToolBar;
@property LinesView *topLinesView;
@property LinesView *leftLinesView;
@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        linesWidth = 3;
        gridLines = [[NSMutableSet alloc] init];
        linesSettings = [[LinesSettings alloc] init];
        [self drawLineMenus];
        [self setupMenu];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawLineMenus];
}

- (void)drawLineMenus {
    [self setView:[[NSView alloc]initWithFrame:NSScreen.mainScreen.frame]];
    voidSize = CGSizeMake(20, 20);
    
    _gridToolBar = [[GridToolbar alloc] init];
    [self.view addSubview:_gridToolBar];
    _gridToolBar.translatesAutoresizingMaskIntoConstraints = false;
    [[_gridToolBar.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0] setActive:true];
    [[_gridToolBar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0] setActive:true];
    [[_gridToolBar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0] setActive:true];
    [[_gridToolBar.heightAnchor constraintEqualToConstant:20] setActive:true];
    
    NSView *voidView = [[NSView alloc] init];
    [self.view addSubview:voidView];
    voidView.translatesAutoresizingMaskIntoConstraints = false;
    [[voidView.topAnchor constraintEqualToAnchor:_gridToolBar.bottomAnchor constant:0] setActive:true];
    [[voidView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0] setActive:true];
    [[voidView.heightAnchor constraintEqualToConstant:voidSize.height] setActive:true];
    [[voidView.widthAnchor constraintEqualToConstant:voidSize.width] setActive:true];
    [voidView setBackGroundColor:NSColor.midNightBlue];
    
    __block MainViewController* this = self;
    
    _topLinesView = [[LinesView alloc] init];
    [self.view addSubview:_topLinesView];
    _topLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_topLinesView.topAnchor constraintEqualToAnchor:voidView.topAnchor constant:0] setActive:true];
    [[_topLinesView.bottomAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_topLinesView.leftAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
    [[_topLinesView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0] setActive:true];
    [_topLinesView setDirection:1];
    _topLinesView.onMouseMoved = ^(NSPoint point) {
        [this drawTemplateView:point direction:1];
    };
    _topLinesView.onMouseExited = ^ {
        [this removeTemplate];
    };
    _topLinesView.onMouseLeftClick = ^(NSPoint point) {
        [this addGridLine:point direction:HORIZONTAL];
    };
    
    _leftLinesView = [[LinesView alloc] init];
    [self.view addSubview:_leftLinesView];
    _leftLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_leftLinesView.topAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.leftAnchor constraintEqualToAnchor:voidView.leftAnchor constant:0] setActive:true];
    [[_leftLinesView.rightAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
    _leftLinesView.onMouseMoved = ^(NSPoint point) {
        [this drawTemplateView:point direction:VERTICAL];
    };
    _leftLinesView.onMouseExited = ^ {
        [this removeTemplate];
    };
    _leftLinesView.onMouseLeftClick = ^(NSPoint point) {
        [this addGridLine:point direction:0];
    };
}

#pragma mark menu
-(void)setupMenu {
    NSMenu *menu = NSApp.mainMenu;
    NSMenuItem *gridItem = [[NSMenuItem alloc] init];
    [menu addItem:gridItem];
    
    NSMenu *gridMenu = [[NSMenu alloc] initWithTitle:@"Grid"];
    
    NSMenuItem *removeAllItem = [[NSMenuItem alloc] initWithTitle:@"Remove all" action:@selector(removeGridLines) keyEquivalent:@"r"];
    removeAllItem.enabled = false;
    [gridMenu addItem:removeAllItem];
    
    NSMenuItem *gridPreferencesItem = [[NSMenuItem alloc] initWithTitle:@"Preferences"
                                                                 action:@selector(showGridLinesPreferences)
                                                          keyEquivalent:@"p"];
    gridPreferencesItem.enabled = false;
    [gridMenu addItem:gridPreferencesItem];
    
    [gridItem setSubmenu:gridMenu];
}

#pragma mark Template view
-(void)drawTemplateView:(NSPoint)point direction:(LinesViewDirection)direction {
    [self removeTemplate];
    
    CGRect rect;
    uint8 width = 1;
    if (direction == VERTICAL) {
        rect = CGRectMake(voidSize.width,
                          point.y + 20,
                          NSScreen.mainScreen.frame.size.width,
                          width);
    } else {
        rect = CGRectMake(point.x,
                          -voidSize.height - 20,
                          width,
                          NSScreen.mainScreen.frame.size.height);
    }
    
    templateView = [[NSView alloc] initWithFrame:rect];
    [templateView setBackGroundColor:NSColor.redColor];
    [self.view addSubview:templateView];
}

-(void)removeTemplate{
    if (templateView == nil) { return; }
    [templateView removeFromSuperview];
}

#pragma mark Grid line
-(void)addGridLine:(NSPoint)point direction:(LinesViewDirection)direction {
    CGRect rect;
    if (direction == VERTICAL) {
        rect = CGRectMake(voidSize.width,
                          point.y + 20,
                          NSScreen.mainScreen.frame.size.width,
                          linesWidth);
    } else {
        rect = CGRectMake(point.x - 1,
                          -voidSize.height - 20,
                          linesWidth,
                          NSScreen.mainScreen.frame.size.height);
    }
    
    GridLine *gridLine = [[GridLine alloc] initWithFrame:rect];
    
    __block GridLine *block_gridLine = gridLine;
    __block NSMutableSet *block_gridLines = gridLines;
    gridLine.onMenuRemove = ^{
        [block_gridLine removeFromSuperview];
        [block_gridLines removeObject:block_gridLine];
    };
    gridLine.onDraged = ^ (NSPoint point) {
        if (direction == VERTICAL) {
            block_gridLine.frame = CGRectMake(block_gridLine.frame.origin.x,
                                              point.y + 20,
                                              block_gridLine.frame.size.width,
                                              block_gridLine.frame.size.height);
            return;
        }
        block_gridLine.frame = CGRectMake(point.x,
                                          block_gridLine.frame.origin.y,
                                          block_gridLine.frame.size.width,
                                          block_gridLine.frame.size.height);
    };
    
    [self.view addSubview:gridLine];
    [gridLines addObject:gridLine];
    
    [gridLine drawLine:direction];
}

-(void)removeGridLines {
    for (GridLine *line in gridLines) {
        [line removeFromSuperview];
    }
    [gridLines removeAllObjects];
}

-(void)showGridLinesPreferences {
    GridLinesPreferences *prefs = [[GridLinesPreferences alloc] init];
    prefs.linesSettings = linesSettings;
    prefs.onSliderChange = ^(uint8 value) {
        [self changeLinesWidth:value];
    };
    prefs.onColorSelected = ^(NSColor *color) {
        [self changeLinesColor:color];
    };
    __block LinesSettings *s = linesSettings;
    __block MainViewController *this = self;
    prefs.willClose = ^(LinesSettings *settings) {
        s = settings;
        [this updateLines];
    };
    [prefs showWindow:self];
}

-(void)updateLines {
    [self changeLinesWidth:linesSettings.width];
    [self changeLinesColor:linesSettings.color];
}

-(void)changeLinesWidth:(uint8)width {
    linesWidth = width;
    for (GridLine *g in gridLines) {
        if (g.scrollDirection == HORIZONTAL) {
            g.frame = CGRectMake(g.frame.origin.x,
                                 g.frame.origin.y,
                                 width,
                                 g.frame.size.height);
        }
        if (g.scrollDirection == VERTICAL) {
            g.frame = CGRectMake(g.frame.origin.x,
                                 g.frame.origin.y,
                                 g.frame.size.width,
                                 width);
        }
    }
}

-(void)changeLinesColor:(NSColor*)color {
    for (GridLine *g in gridLines) {
        [g setLineColor:color];
    }
}

@end
