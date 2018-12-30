#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()
@property NSWindowController *windowController;
@property NSWindow *rWindow;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    [self setupMenu];
    
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
    
    [NSApp activateIgnoringOtherApps:true];
    [NSApp run];
}

-(void)setupMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    NSMenuItem *appItem = [[NSMenuItem alloc] init];
    [menu addItem:appItem];
    
    NSMenu *subMenu = [[NSMenu alloc] init];
    NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
    quitItem.enabled = true;
    [subMenu addItem:quitItem];
    
    [appItem setSubmenu:subMenu];
    [NSApp setMainMenu:menu];
}

@end
