#import "GridLinesPreferencesViewController.h"

@interface GridLinesPreferencesViewController ()

@end

@implementation GridLinesPreferencesViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup {
    [self setView:[[NSView alloc]initWithFrame:NSScreen.mainScreen.frame]];
}

@end
