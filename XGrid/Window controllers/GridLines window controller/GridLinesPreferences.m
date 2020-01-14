#import "GridLinesPreferences.h"
#import "GridLinesPreferencesViewController.h"

@interface GridLinesPreferences () <NSWindowDelegate> {
    NSWindow *rWindow;
}
@end

@implementation GridLinesPreferences

#pragma mark Ovverides
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

#pragma mark Window delegates
-(void)windowWillClose:(NSNotification *)notification {
    if (self.willClose == nil)  { return; }
    if (self.linesSettings == nil)   { return; }
    self.willClose(self.linesSettings);
}

#pragma mark UI
-(void)setup {
    self.linesSettings = [[LinesSettings alloc] init];
    
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
    rWindow.delegate = self;
    
    GridLinesPreferencesViewController *vc =  [[GridLinesPreferencesViewController alloc] initWith:self.linesSettings];
    vc.onColorSelected = ^(NSColor *color) {
        if (self.onColorSelected == nil) { return; }
        self.onColorSelected(color);
    };
    vc.saveClicked = ^(LinesSettings *newSettings) {
        [self.linesSettings setColor:newSettings.color];
        [self.linesSettings setWidth:newSettings.width];
        [self->rWindow close];
    };
    rWindow.contentViewController = vc;
    
    [self setWindow:rWindow];
    [rWindow center];
}

@end
