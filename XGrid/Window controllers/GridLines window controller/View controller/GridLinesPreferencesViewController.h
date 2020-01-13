#import <Cocoa/Cocoa.h>
#import "LinesSettings.h"

@interface GridLinesPreferencesViewController : NSViewController

@property (nonatomic) LinesSettings *linesSettings;

@property (nonatomic, copy) void (^onSliderChange)(uint8);
@property (nonatomic, copy) void (^onColorSelected)(NSColor*);
@property (nonatomic, copy) void (^saveClicked)(LinesSettings*);

- (instancetype)initWith:(LinesSettings*)settings;

@end
