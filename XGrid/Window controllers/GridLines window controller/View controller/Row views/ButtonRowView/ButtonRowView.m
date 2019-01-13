//
//  ButtonRowView.m
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import "ButtonRowView.h"

@interface ButtonRowView () {
    NSButton *button;
}
@end

@implementation ButtonRowView

#pragma mark Ovverides
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark Funcs
-(void)setButtonTitle:(NSString *)buttonTitle {
    [button setTitle:buttonTitle];
}

-(NSString *)buttonTitle {
    return self.buttonTitle;
}

-(void)buttonClicked {
    if (self.onButtonClick == nil) { return; }
    self.onButtonClick();
}

#pragma mark UI
-(void)setupUI {
    button = [[NSButton alloc] init];
    [self addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = false;
    [[button.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:true];
    [[button.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:true];
    button.target = self;
    button.action = @selector(buttonClicked);
}

@end
