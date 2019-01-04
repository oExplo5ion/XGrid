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
    rWindow.opaque                     = false;
    rWindow.hasShadow                  = false;
    rWindow.movable                    = false;
    rWindow.titlebarAppearsTransparent = true;
    rWindow.titleVisibility            = NSWindowTitleHidden;
    rWindow.contentViewController      = [[GridLinesPreferencesViewController alloc] init];
    
    [self setWindow:rWindow];
}

@end
