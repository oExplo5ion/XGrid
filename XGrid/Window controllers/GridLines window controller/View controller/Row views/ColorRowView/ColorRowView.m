//
//  ColorRowView.m
//  XGrid
//
//  Created by Mac on 1/12/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "ColorRowView.h"
#import "ColorCircleView.h"
#import "NSView+XGrid.h"
#import "ColorCircleItem.h"

@interface ColorRowView () <NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout> {
    uint8 size;
    NSScrollView *scrollView;
    NSCollectionView *collectionView;
    NSString *reuseColorItem;
}
@end

@implementation ColorRowView

#pragma mark Ovverides
- (instancetype)init
{
    self = [super init];
    if (self) {
        size = 40;
        reuseColorItem = @"reuseColorItem";
        [self setupUI];
    }
    return self;
}

#pragma mark Funcs
-(void)colorSelected:(NSColor*)color {
    if (self.onColorSelected == nil) { return; }
    self.onColorSelected(color);
}

#pragma mark UI
-(void)setupUI {
    NSTextField *title = [[NSTextField alloc] init];
    [self addSubview:title];
    title.translatesAutoresizingMaskIntoConstraints = false;
    [[title.topAnchor constraintEqualToAnchor:self.topAnchor constant: 0] setActive:true];
    [[title.leftAnchor constraintEqualToAnchor:self.leftAnchor constant: 5] setActive:true];
    [[title.rightAnchor constraintEqualToAnchor:self.rightAnchor constant: -5] setActive:true];
    [title setBezeled:false];
    [title setEditable:false];
    title.stringValue = @"Line color";
    
    scrollView = [[NSScrollView alloc] init];
    [self addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    [[scrollView.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:3] setActive:true];
    [[scrollView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:true];
    [[scrollView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:5] setActive:true];
    [[scrollView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-5] setActive:true];
    
    collectionView = [[NSCollectionView alloc] init];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColors = @[NSColor.clearColor];
    [collectionView registerClass:ColorCircleItem.class forItemWithIdentifier:reuseColorItem];
    
    NSCollectionViewFlowLayout *layout = [[NSCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = NSCollectionViewScrollDirectionHorizontal;
    collectionView.collectionViewLayout = layout;
    
    scrollView.documentView = collectionView;
}

#pragma mark Collection view
-(NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(size, size);
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    // cyan
    if (indexPath.item == 0) {
        return [self getColorCircleItemWithColor:NSColor.cyanColor];
    }
    // red
    if (indexPath.item == 1) {
        return [self getColorCircleItemWithColor:NSColor.redColor];
    }
    return [[NSCollectionViewItem alloc] init];
}

-(ColorCircleItem*)getColorCircleItemWithColor:(NSColor*)color {
    ColorCircleItem *item = [[ColorCircleItem alloc] init];
    __block ColorRowView *this = self;
    item.onColorPicked = ^(NSColor *color) {
        if (this.onColorSelected == nil) { return; }
        this.onColorSelected(color);
    };
    [item setCurrentColor:color];
    return item;
}

@end
