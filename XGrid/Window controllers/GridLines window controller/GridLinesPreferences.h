#import <Cocoa/Cocoa.h>
#import "LinesSettings.h"

@interface GridLinesPreferences : NSWindowController

@property (nonatomic) LinesSettings *linesSettings;

@property (nonatomic, copy) void (^onSliderChange)(CGFloat);
@property (nonatomic, copy) void (^onColorSelected)(NSColor*);
@property (nonatomic, copy) void (^willClose)(LinesSettings*);

@end
