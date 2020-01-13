#import <Cocoa/Cocoa.h>
#import "LinesView.h"

@interface GridLine : NSView

@property LinesViewDirection scrollDirection;

/**
 * Draw line vivisble to user
 */
-(void)drawLine:(LinesViewDirection)direction color:(NSColor*_Nonnull)color;

-(void)setLineColor:(NSColor*_Nonnull)color;

/**
 * User has dragged view
 */
@property (atomic, copy, nullable) void (^onDraged)(NSPoint);

/**
 * Menus Remove button clicked
 */
@property (atomic, copy, nullable) void (^onMenuRemove)(void);

@end
