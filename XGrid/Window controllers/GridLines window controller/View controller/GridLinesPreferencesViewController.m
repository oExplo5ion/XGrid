#import "GridLinesPreferencesViewController.h"
#import "NSView+XGrid.h"
#import "SliderRowView.h"
#import "PersistantStorage.h"
#import "ColorRowView.h"

@interface GridLinesPreferencesViewController () <NSTableViewDelegate, NSTableViewDataSource> {
    NSTableView *tableView;
    NSString *reuseColumn;
}
@end

@implementation GridLinesPreferencesViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        reuseColumn = @"reuseColumn";
        [self setup];
    }
    return self;
}

-(void)setup {
    [self setView:[[NSView alloc]init]];
    [self.view setBackGroundColor:NSColor.whiteColor];
    [[self.view.heightAnchor constraintEqualToConstant:300] setActive:true];
    [[self.view.widthAnchor constraintEqualToConstant:300] setActive:true];
    
    NSScrollView *scrollView = [[NSScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [[scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:30] setActive:true];
    [[scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0] setActive:true];
    [[scrollView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0] setActive:true];
    [[scrollView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0] setActive:true];
    
    tableView = [[NSTableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.headerView = nil;
    [tableView addTableColumn: [[NSTableColumn alloc] initWithIdentifier: reuseColumn]];
    
    scrollView.documentView = tableView;
}

#pragma mark Table view
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    // 0 - slider (size of grid lines)
    if (row == 0) {
        return 60.0f;
    }
    // 1 - lines color {
    if (row == 1) {
        return 58.0f;
    }
    return 0.0001f;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // 0 - slider (size of grid lines)
    if (row == 0) {
        SliderRowView *row = [[SliderRowView alloc] init];
        row.onSliderChange = ^(int value) {
            if (self.onSliderChange == nil) { return; }
            self.onSliderChange(value);
        };
        [row setSliderValue: PersistantStorage.lineSize];
        return row;
    }
    // 1 - lines color
    if (row == 1) {
        ColorRowView *row = [[ColorRowView alloc] init];
        row.onColorSelected = ^(NSColor *color) {
            if (self.onColorSelected == nil) { return; }
            self.onColorSelected(color);
        };
        return row;
    }
    return [[NSView alloc] init];
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return false;
}

@end
