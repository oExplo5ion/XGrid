#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()
@property NSWindowController *windowController;
@property NSWindow *rWindow;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _rWindow = [[NSWindow alloc] initWithContentRect:NSScreen.mainScreen.frame
                                           styleMask:NSWindowStyleMaskClosable | NSWindowStyleMaskTitled | NSWindowStyleMaskFullSizeContentView
                                             backing:NSBackingStoreBuffered
                                               defer:NO];
    _rWindow.backgroundColor            = NSColor.clearColor;
    _rWindow.alphaValue                 = 1.0f;
    _rWindow.opaque                     = false;
    _rWindow.hasShadow                  = false;
    _rWindow.movable                    = false;
    _rWindow.titlebarAppearsTransparent = true;
    _rWindow.titleVisibility            = NSWindowTitleHidden;
    _rWindow.contentViewController      = [[MainViewController alloc] init];
    
    _windowController = [[NSWindowController alloc] init];
    [_windowController setWindow:_rWindow];
    [_windowController showWindow:self];
    [NSApp run];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    
}


@end
