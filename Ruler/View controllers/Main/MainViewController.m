#import "MainViewController.h"
#import "NSView+Ruler.h"
#import "NSColor+Ruler.h"
#import "LinesView.h"
#import "GridToolbar.h"

@interface MainViewController ()
@property GridToolbar *gridToolBar;
@property LinesView *topLinesView;
@property LinesView *leftLinesView;
@end

@implementation MainViewController

- (instancetype)init
{
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
    
    _topLinesView = [[LinesView alloc] init];
    [self.view addSubview:_topLinesView];
    _topLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_topLinesView.topAnchor constraintEqualToAnchor:voidView.topAnchor constant:0] setActive:true];
    [[_topLinesView.bottomAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_topLinesView.leftAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
    [[_topLinesView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0] setActive:true];
    [_topLinesView setDirection:1];
    
    _leftLinesView = [[LinesView alloc] init];
    [self.view addSubview:_leftLinesView];
    _leftLinesView.translatesAutoresizingMaskIntoConstraints = false;
    [[_leftLinesView.topAnchor constraintEqualToAnchor:voidView.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[_leftLinesView.leftAnchor constraintEqualToAnchor:voidView.leftAnchor constant:0] setActive:true];
    [[_leftLinesView.rightAnchor constraintEqualToAnchor:voidView.rightAnchor constant:0] setActive:true];
}

@end
