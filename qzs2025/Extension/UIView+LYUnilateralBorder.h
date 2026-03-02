#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LYUnilateralBorder)

@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;

-(void)setBorderWithTop:(BOOL)top
                   Left:(BOOL)left
                 Bottom:(BOOL)bottom
                  Right:(BOOL)right
            BorderColor:(UIColor *)borderColor
            BorderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
