#import <Cocoa/Cocoa.h>

@interface GridLinesPreferencesViewController : NSViewController

@property (nonatomic, copy) void (^onSliderChange)(uint8);
@property (nonatomic, copy) void (^onColorSelected)(NSColor*);

@end
