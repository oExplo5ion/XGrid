#import <Cocoa/Cocoa.h>

@interface GridLinesPreferences : NSWindowController

@property (nonatomic, copy) void (^onSliderChange)(uint8);

@end
