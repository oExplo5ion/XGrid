#import <Cocoa/Cocoa.h>

typedef enum LinesViewDirection: UInt8 {
    VERTICAL = 0,
    HORIZONTAL = 1
} LinesViewDirection;

@interface LinesView : NSView

/**
 * Adds `NSCollectionView` with lines with given direction
 */
-(void)setDirection:(LinesViewDirection)direction;

/**
 * Sends mouse position when mouse has been moved
 */
@property (atomic, copy, nullable) void (^onMouseMoved)(NSPoint);

/**
 * Gets called when mouse exited the view
 */
@property (atomic, copy, nullable) void (^onMouseExited)(void);

/**
 * Sends mouse position when left button has been clicked
 */
@property (atomic, copy, nullable) void (^onMouseLeftClick)(NSPoint);

@end
