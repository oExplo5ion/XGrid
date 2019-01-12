#import "GridLinesPreferences.h"
#import "GridLinesPreferencesViewController.h"

@interface GridLinesPreferences () {
    NSWindow *rWindow;
}
@end

@implementation GridLinesPreferences

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
}

-(void)setup {
    rWindow = [[NSWindow alloc] initWithContentRect:NSScreen.mainScreen.frame
                                           styleMask:NSWindowStyleMaskClosable | NSWindowStyleMaskTitled | NSWindowStyleMaskFullSizeContentView
                                             backing:NSBackingStoreBuffered
                                               defer:NO];
    rWindow.backgroundColor            = NSColor.clearColor;
    rWindow.alphaValue                 = 1.0f;
    rWindow.titlebarAppearsTransparent = true;
    rWindow.titleVisibility            = NSWindowTitleVisible;
    rWindow.title                      = @"Grid preferences";
    [[rWindow standardWindowButton:NSWindowZoomButton] setHidden:true];
    [[rWindow standardWindowButton:NSWindowMiniaturizeButton] setHidden:true];
    
    GridLinesPreferencesViewController *vc =  [[GridLinesPreferencesViewController alloc] init];
    vc.onSliderChange = ^(uint8 value) {
        if (self.onSliderChange == nil) { return; }
        self.onSliderChange(value);
    };
    vc.onColorSelected = ^(NSColor *color) {
        if (self.onColorSelected == nil) { return; }
        self.onColorSelected(color);
    };
    rWindow.contentViewController = vc;
    
    [self setWindow:rWindow];
    [rWindow center];
}

@end
