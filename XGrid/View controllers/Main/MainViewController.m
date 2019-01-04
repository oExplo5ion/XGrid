#import "MainViewController.h"
#import "NSView+XGrid.h"
#import "NSColor+XGrid.h"
#import "LinesView.h"
#import "GridToolbar.h"
#import "GridLine.h"

@interface MainViewController () {
    NSView *templateView;
    CGSize voidSize;
    NSMutableSet *gridLines;
}
@property GridToolbar *gridToolBar;
@property LinesView *topLinesView;
@property LinesView *leftLinesView;
@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        gridLines = [[NSMutableSet alloc] init];
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
        [this addGridLine:point direction:1];
    };
    
    _leftLinesView = [[LinesView alloc] init];
    [self.view addSubview:_leftLinesView];
    _leftLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_leftLinesView.topAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.leftAnchor constraintEqualToAnchor:voidView.leftAnchor constant:0] setActive:true];
    [[_leftLinesView.rightAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
    _leftLinesView.onMouseMoved = ^(NSPoint point) {
        [this drawTemplateView:point direction:0];
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
    if (direction == 0) {
        rect = CGRectMake(voidSize.width,
                          point.y,
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
    uint8 width = 1;
    if (direction == 0) {
        rect = CGRectMake(voidSize.width,
                          point.y,
                          NSScreen.mainScreen.frame.size.width,
                          width);
    } else {
        rect = CGRectMake(point.x,
                          -voidSize.height - 20,
                          width,
                          NSScreen.mainScreen.frame.size.height);
    }
    
    GridLine *gridLine = [[GridLine alloc] initWithFrame:rect];
    [self.view addSubview:gridLine];
    [gridLines addObject:gridLine];
}

-(void)removeGridLines {
    for (GridLine *line in gridLines) {
        [line removeFromSuperview];
    }
}

-(void)showGridLinesPreferences {
    
}

@end
