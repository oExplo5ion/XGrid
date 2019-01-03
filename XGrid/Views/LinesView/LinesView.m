#import "LinesView.h"
#import "NSView+XGrid.h"
#import "LinesItem.h"
#import "NSColor+XGrid.h"

@interface LinesView () <NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout> {
    NSScrollView *scrollView;
    NSCollectionView *collectionView;
    NSString *reuseLinesItem;
    LinesViewDirection collectionDirection;
}
@end

@implementation LinesView

#pragma mark Ovverides
-(BOOL)wantsDefaultClipping {
    return false;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        reuseLinesItem = @"reuseLinesItem";
        [self setupCollectionView];
//        [self addTrackingArea];
        
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(void)layout {
    [super layout];
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                                   options:(NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveAlways)
                                                                     owner:self
                                                                  userInfo:nil];
    [self addTrackingArea:trackingArea];
}

#pragma mark Mouse events
-(void)mouseMoved:(NSEvent *)event {
    NSLog(@"moved");
}

-(void)mouseExited:(NSEvent *)event {
    NSLog(@"exited");
}

#pragma mark Collection view funcs
- (void)setupCollectionView {
    scrollView = [[NSScrollView alloc] init];
    [self addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [[scrollView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:true];
    [[scrollView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[scrollView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0] setActive:true];
    [[scrollView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0] setActive:true];
    
    collectionView = [[NSCollectionView alloc] init];
    [collectionView registerClass:LinesItem.class forItemWithIdentifier:reuseLinesItem];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColors = @[NSColor.midNightBlue];
    [self setDirection:0];
    
    scrollView.documentView = collectionView;
}

- (void)setDirection:(LinesViewDirection)direction {
    collectionView.collectionViewLayout = nil;
    collectionDirection = direction;
    
    // vertical
    if (direction == 0) {
        [self setVerticalLayout];
    }
    // horizontal
    if (direction == 1) {
        [self setHorizontalLayout];
    }
}

- (void)setHorizontalLayout {
    NSCollectionViewFlowLayout *layout = [[NSCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = NSCollectionViewScrollDirectionHorizontal;
    collectionView.collectionViewLayout = layout;
}

- (void)setVerticalLayout {
    NSCollectionViewFlowLayout *layout = [[NSCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = NSCollectionViewScrollDirectionVertical;
    collectionView.collectionViewLayout = layout;
}

#pragma mark Collection view delegate
-(NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return (collectionDirection == 0) ? [self getVerticalSize] : [self getHorizontalSize];
}

-(CGSize)getHorizontalSize {
    return CGSizeMake(1, self.bounds.size.height);
}

-(CGSize)getVerticalSize {
    return CGSizeMake(self.bounds.size.width, 1);
}

-(NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (collectionView == 0) ? NSScreen.mainScreen.frame.size.height / 10 : NSScreen.mainScreen.frame.size.width / 10;
}

-(NSCollectionViewItem*)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    return [[LinesItem alloc] init];
}

@end
