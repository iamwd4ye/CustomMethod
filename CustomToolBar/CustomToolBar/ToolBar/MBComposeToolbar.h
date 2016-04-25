

#import <UIKit/UIKit.h>

typedef enum {
    MBComposeToolbarButtonTypeCamera, // 照相机
    MBComposeToolbarButtonTypePicture, // 相册
    MBComposeToolbarButtonTypeMention, // 提到@
    MBComposeToolbarButtonTypeTrend, // 话题
    MBComposeToolbarButtonTypeEmotion // 表情
} MBComposeToolbarButtonType;

@class MBComposeToolbar;

@protocol MBComposeToolbarDelegate <NSObject>

@optional
- (void)composeTool:(MBComposeToolbar *)toolbar didClickedButton:(MBComposeToolbarButtonType)buttonType;

@end

@interface MBComposeToolbar : UIView
@property (nonatomic, weak) id<MBComposeToolbarDelegate> delegate;
@end
