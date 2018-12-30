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

@end
