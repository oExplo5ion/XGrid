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
 * Returns mouse position when mouse has been moved
 */
@property (atomic, copy) void (^mouseMoved)(NSPoint);

/**
 * Gets called when mouse exited the view
 */
@property (atomic, copy) void (^mouseExited)(void);

@end
