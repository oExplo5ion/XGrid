#import <Cocoa/Cocoa.h>
#import "LinesSettings.h"

@interface GridLinesPreferences : NSWindowController

@property (weak, nonatomic) LinesSettings *linesSettings;

@property (nonatomic, copy) void (^onSliderChange)(uint8);
@property (nonatomic, copy) void (^onColorSelected)(NSColor*);
@property (nonatomic, copy) void (^willClose)(LinesSettings*);

@end
