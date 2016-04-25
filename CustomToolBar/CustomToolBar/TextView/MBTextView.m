

#import "MBTextView.h"

@interface MBTextView() <UITextViewDelegate>
@property (nonatomic, weak) UILabel *placehoderLabel;
@end

@implementation MBTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        // 添加一个显示提醒文字的label（显示占位文字的label）
        UILabel *placehoderLabel = [[UILabel alloc] init];
        placehoderLabel.numberOfLines = 0;
        placehoderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:placehoderLabel];
        self.placehoderLabel = placehoderLabel;
        
        // 设置默认的占位文字颜色
        self.placehoderColor = [UIColor lightGrayColor];
        
        // 设置默认的字体
        self.font = [UIFont systemFontOfSize:14];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 监听文字改变
- (void)textDidChange
{
    self.placehoderLabel.hidden = (self.text.length != 0);
}

#pragma mark - 公共方法
- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setPlacehoder:(NSString *)placehoder
{
    //如果是copy策略，setter最好这么写
    _placehoder = [placehoder copy];
    
    // 设置文字
    self.placehoderLabel.text = placehoder;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor
{
    _placehoderColor = placehoderColor;
    
    // 设置颜色
    self.placehoderLabel.textColor = placehoderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placehoderLabel.font = font;
    
    // 重新计算子控件的fame
    [self setNeedsLayout];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat placehoderLabelY = 8;
    CGFloat placehoderLabelX = 5;
    CGFloat placehoderLabelW = self.frame.size.width - 2 * placehoderLabelX;
    // 根据文字计算label的高度
    CGSize maxSize = CGSizeMake(placehoderLabelW, MAXFLOAT);
    
    CGSize placehoderSize = [self sizeWithText:self.placehoderLabel.text font:self.placehoderLabel.font maxSize:maxSize];
    
    CGFloat placehoderLabelH = placehoderSize.height;
    
    self.placehoderLabel.frame = CGRectMake(placehoderLabelX, placehoderLabelY, placehoderLabelW, placehoderLabelH);
}

@end
