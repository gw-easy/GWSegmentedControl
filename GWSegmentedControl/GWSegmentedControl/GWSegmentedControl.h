

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GWSegmentedControlType) {
    SCType_Underline = 1,      //下划线
    SCType_Dot,            //圆点
    SCType_Ellipse,        //椭圆背景
    SCType_SelectChange,   //选中按钮样式字体发生变化
    SCType_BorderStyle,    //边框填充样式
    SCType_None            //没有效果
};

typedef NS_ENUM(NSUInteger, GWButtonEdgeInsetsStyle) {
    ZFJButtonEdgeInsetsStyleTop = 1,    // image在上，label在下
    ZFJButtonEdgeInsetsStyleLeft,   // image在左，label在右
    ZFJButtonEdgeInsetsStyleBottom, // image在下，label在上
    ZFJButtonEdgeInsetsStyleRight,  // image在右，label在左
    ZFJButtonEdgeInsetsStyleNone    //如果设置的不合适可以自己设置
};

typedef void (^ SelectBtn)(NSInteger selectIndex,NSString *selectIndexTitle);

@interface GWSegmentedControl : UIView

//titleArr 选择按钮的title
//iconArr  选择按钮的icon
//SCType   选择器的风格
//titleArr和iconArr 必须有一个不能为空
- (instancetype)initwithTitleArr:(NSArray *)titleArr iconArr:(NSArray *)iconArr selectIconArr:(NSArray *)selectIconArr SCType:(GWSegmentedControlType)SCType;

- (void)startLoading;

//选择某个按钮的回调
@property (nonatomic,copy) SelectBtn selectType;
//选择按钮的宽度 默认是均分
@property (nonatomic,assign) CGFloat selectBtnWID;
//按钮之间的间距 如果设置了边框borderWidth，则设置间距是没有用
@property (nonatomic,assign) CGFloat selectBtnSpace;
//常态字体颜色
@property (nonatomic,strong) UIColor *titleColor;
//选中字体颜色
@property (nonatomic,strong) UIColor *selectTitleColor;
//头部按钮的字体
@property (nonatomic,strong) UIFont *titleFont;
//选中按钮的字体样式
@property (nonatomic,strong) UIFont *selectBtnFont;
//设置背景动画的时间 默认0.01
@property (nonatomic,assign) CGFloat animateDuration;
//若果图片和文字同事存在 设置图片和文字的位置 默认image在上，label在下
@property (nonatomic,assign) GWButtonEdgeInsetsStyle edgeInsetsStyle;
//若果图片和文字同事存在 设置图片和文字的间距 默认0
@property (nonatomic,assign) CGFloat edgeInsetsSpace;
//是否显示边框 默认是0 不显示
@property (nonatomic,assign) CGFloat borderWidth;
//头部按钮的背景颜色 默认是透明
@property (nonatomic,strong) UIColor *titleBtnBackColor;
//选中了第几个按钮 可以设置 手动选择某个按钮
@property (nonatomic,assign) NSInteger selectIndex;

//如果GWButtonEdgeInsetsStyle 是 GWButtonEdgeInsetsStyleNone 需要手动设置
@property (nonatomic,assign) UIEdgeInsets imageEdgeInsets;
@property (nonatomic,assign) UIEdgeInsets labelEdgeInsets;

//下划线的高度 &&&& 圆点的直径
@property (nonatomic,assign) CGFloat SCType_Underline_HEI;//默认的高度为2

//椭圆背景的背景颜色
@property (nonatomic,strong) UIColor *ellipseBackColor;//默认黑色 透明度0.2
@property (nonatomic,assign) CGFloat cornerRadius;//设置圆角 为0不设置 默认2


@end


























