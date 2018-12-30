#import "LinesItem.h"
#import "NSView+Ruler.h"
#import "LinesItemView.h"

@interface LinesItem ()

@end

@implementation LinesItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupUI {
    self.view = [[LinesItemView alloc] init];
}

@end
