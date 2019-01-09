#import <Cocoa/Cocoa.h>

@interface GridLinesPreferencesViewController : NSViewController
@property (nonatomic, copy) void (^onSliderChange)(int);
@end
