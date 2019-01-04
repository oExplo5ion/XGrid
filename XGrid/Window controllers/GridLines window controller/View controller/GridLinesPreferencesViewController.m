#import "GridLinesPreferencesViewController.h"
#import "NSView+XGrid.h"

@interface GridLinesPreferencesViewController () {
    NSTableView *tableView;
}
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
    [self setView:[[NSView alloc]init]];
    [self.view setBackGroundColor:NSColor.whiteColor];
    [[self.view.heightAnchor constraintEqualToConstant:300] setActive:true];
    [[self.view.widthAnchor constraintEqualToConstant:400] setActive:true];
    
    tableView = [[NSTableView alloc] init];
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    [[tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20] setActive:true];
    [[tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0] setActive:true];
    [[tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0] setActive:true];
    tableView.backgroundColor = NSColor.redColor;
}

@end
