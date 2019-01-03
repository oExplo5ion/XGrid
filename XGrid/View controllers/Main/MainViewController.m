#import "MainViewController.h"
#import "NSView+XGrid.h"
#import "NSColor+XGrid.h"
#import "LinesView.h"
#import "GridToolbar.h"

@interface MainViewController () {
    NSView *templateView;
}
@property GridToolbar *gridToolBar;
@property LinesView *topLinesView;
@property LinesView *leftLinesView;
@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self drawLineMenus];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawLineMenus];
}

- (void)drawLineMenus {
    [self setView:[[NSView alloc]initWithFrame:NSScreen.mainScreen.frame]];
    
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
    [[voidView.heightAnchor constraintEqualToConstant:20] setActive:true];
    [[voidView.widthAnchor constraintEqualToConstant:20] setActive:true];
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
    _topLinesView.mouseMoved = ^(NSPoint point) {
        [this drawTemplateView:point direction:1];
    };
    _topLinesView.mouseExited = ^ {
        [this removeTemplate];
    };
    
    _leftLinesView = [[LinesView alloc] init];
    [self.view addSubview:_leftLinesView];
    _leftLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_leftLinesView.topAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.leftAnchor constraintEqualToAnchor:voidView.leftAnchor constant:0] setActive:true];
    [[_leftLinesView.rightAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
    _leftLinesView.mouseMoved = ^(NSPoint point) {
        [this drawTemplateView:point direction:0];
    };
    _leftLinesView.mouseExited = ^ {
        [this removeTemplate];
    };
}

#pragma mark Template view

-(void)drawTemplateView:(NSPoint)point direction:(LinesViewDirection)direction {
    [self removeTemplate];
    
    CGRect rect;
    uint8 width = 1;
    if (direction == 0) {
        rect = CGRectMake(20,
                          point.y,
                          NSScreen.mainScreen.frame.size.width,
                          width);
    } else {
        rect = CGRectMake(point.x,
                          -40,
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

@end
