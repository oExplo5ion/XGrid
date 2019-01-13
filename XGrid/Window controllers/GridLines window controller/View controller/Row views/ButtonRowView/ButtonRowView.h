//
//  ButtonRowView.h
//  XGrid
//
//  Created by Mac on 1/13/19.
//  Copyright © 2019 alekseyrobul. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ButtonRowView : NSView

@property (nonatomic, assign) NSString *buttonTitle;
@property (nonatomic, copy) void (^onButtonClick) (void);

@end
