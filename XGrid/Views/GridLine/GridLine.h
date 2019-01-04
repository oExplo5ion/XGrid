#import <Cocoa/Cocoa.h>

@interface GridLine : NSView

@property (atomic, copy, nullable) void (^onMenuRemove)(void);

@end
