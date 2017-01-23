

#import "GWSegmentedControl.h"
#import "GWSegmentBtn.h"
@interface GWSegmentedControl ()<UICollectionViewDelegate>

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *iconArr;
@property (strong,nonatomic) NSArray *selectIconArr;
@property (nonatomic,assign) GWSegmentedControlType SCType;   //类型
@property (nonatomic,strong) UIScrollView *scrollView;         //底部滚动视图
@property (nonatomic,assign) NSInteger btnCount;               //按钮的数量
@property (nonatomic,strong) NSMutableArray *titleArray;       //存放按钮的数组
@property (nonatomic,strong) UIView *stateView;                //按钮下面的伴随状态按钮
@property (nonatomic,assign) BOOL isSetWID;                //是否是默认宽度

@end

@implementation GWSegmentedControl

- (instancetype)initwithTitleArr:(NSArray *)titleArr iconArr:(NSArray *)iconArr selectIconArr:(NSArray *)selectIconArr SCType:(GWSegmentedControlType)SCType{
    if(self == [super init]){
        self.titleArr = titleArr;
        self.iconArr = iconArr;
        self.selectIconArr = selectIconArr;
        self.SCType = SCType;
        [self initValue];
        [self uiConfig];
    }
    return self;
}

- (void)startLoading{
    [self uiConfig];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _selectBtnWID = _isSetWID == NO ? (frame.size.width - (_btnCount - 1) * _selectBtnSpace)/_btnCount : _selectBtnWID;
//    [self uiConfig];
}

- (void)setSelectBtnWID:(CGFloat)selectBtnWID{
    _isSetWID = YES;
    _selectBtnWID = selectBtnWID;
//    [self uiConfig];
}

- (void)setSelectBtnSpace:(CGFloat)selectBtnSpace{
    _selectBtnSpace = selectBtnSpace;
    _selectBtnWID = _isSetWID == NO ? (self.frame.size.width - (_btnCount - 1) * _selectBtnSpace)/_btnCount : _selectBtnWID;
//    [self uiConfig];
}


- (void)initValue{
    self.clipsToBounds = YES;
    _edgeInsetsStyle = ZFJButtonEdgeInsetsStyleTop;
    _animateDuration = 0.01;
    _selectBtnWID = 0;
    _selectBtnSpace = 0;
    _selectIndex = 0;//默认选中第一个
    _SCType_Underline_HEI = 2;
    _btnCount = self.titleArr.count!=0 ? self.titleArr.count : self.iconArr.count;
    _titleColor = [UIColor blackColor];
    _selectTitleColor = [UIColor colorWithRed:0.933 green:0.204 blue:0.035 alpha:1.00];//RGB:238 52 9
    _ellipseBackColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:0.2];
    _titleBtnBackColor = [UIColor clearColor];
    _cornerRadius = 2;
    _edgeInsetsSpace = 0;
    _titleFont = [UIFont systemFontOfSize:16];
}

- (void)uiConfig{
    if(_btnCount==0) return;//如果没有值 直接返回
    
    if(self.scrollView == nil){
        self.scrollView = [[UIScrollView alloc]init];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
    }
    for (UIView *view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(_selectBtnWID * _btnCount + _selectBtnSpace * (_btnCount - 1), 0);
    [self addSubview:self.scrollView];
    
    //清空数组
    [self.titleArray removeAllObjects];
    
    for (int i= 0; i<_btnCount; i++) {
        GWSegmentBtn *titleBtn = [[GWSegmentBtn alloc]init];
        titleBtn.backgroundColor = _titleBtnBackColor;
        titleBtn.frame = CGRectMake((_selectBtnWID + _selectBtnSpace) * i, 0, _selectBtnWID, self.frame.size.height);
        titleBtn.edgeStyle = (int)self.edgeInsetsStyle;
        if(self.titleArr.count>0){
            [titleBtn setTitle:_titleArr[i] forState:UIControlStateNormal];
        }
        if(self.iconArr.count>0){
            [titleBtn setImage:[UIImage imageNamed:_iconArr[i]] forState:UIControlStateNormal];
        }
        
        if (self.selectIconArr.count>0) {
            [titleBtn setImage:[UIImage imageNamed:_selectIconArr[i]] forState:UIControlStateSelected];
        }
        titleBtn.layer.borderWidth = _borderWidth;
        titleBtn.layer.borderColor = _titleColor.CGColor;
        titleBtn.layer.cornerRadius = _cornerRadius;
        titleBtn.layer.masksToBounds = YES;
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleBtn setTitleColor:_titleColor forState:UIControlStateNormal];
        [titleBtn setTitleColor:_selectTitleColor forState:UIControlStateSelected];
        titleBtn.titleLabel.font = _titleFont;
        [self.scrollView addSubview:titleBtn];
        [self.titleArray addObject:titleBtn];
        if(_selectIndex == i){
            titleBtn.titleLabel.font = _selectBtnFont;
            if (self.SCType == SCType_BorderStyle) {
                titleBtn.backgroundColor = _titleColor;
            }
            titleBtn.selected = YES;
        }
    }
    [self setSCTypeUI];
}

#pragma mark - 根据SCType设置相关的风格
- (void)setSCTypeUI{
    GWSegmentBtn *selectBtn = _titleArray[_selectIndex];
    if(self.SCType == SCType_Underline){
        if(self.stateView==nil){
            self.stateView = [[UIView alloc]init];
        }
        self.stateView.frame = CGRectMake(selectBtn.frame.origin.x, self.frame.size.height - _SCType_Underline_HEI, _selectBtnWID, _SCType_Underline_HEI);
        self.stateView.backgroundColor = _selectTitleColor;
        [self.scrollView addSubview:self.stateView];
    }else if(self.SCType == SCType_Dot){
        if(self.stateView==nil){
            self.stateView = [[UIView alloc]init];
        }
        self.stateView.frame = CGRectMake(selectBtn.frame.origin.x + (_selectBtnWID - _SCType_Underline_HEI)/2, self.frame.size.height - _SCType_Underline_HEI, _SCType_Underline_HEI, _SCType_Underline_HEI);
        self.stateView.backgroundColor = _selectTitleColor;
        self.stateView.layer.masksToBounds = YES;
        self.stateView.layer.cornerRadius = _SCType_Underline_HEI/2;
        [self.scrollView addSubview:self.stateView];
    }else if(self.SCType == SCType_Ellipse){
        if(self.stateView==nil){
            self.stateView = [[UIView alloc]init];
        }
        self.stateView.frame = CGRectMake(selectBtn.frame.origin.x, 0, _selectBtnWID, self.frame.size.height);
        self.stateView.backgroundColor = _ellipseBackColor;
        self.stateView.layer.masksToBounds = YES;
        self.stateView.layer.cornerRadius = _cornerRadius;
        [self.scrollView insertSubview:self.stateView belowSubview:selectBtn];
        self.layer.cornerRadius = _cornerRadius;
    }else if (self.SCType == SCType_SelectChange){
        
    }else if (self.SCType == SCType_BorderStyle){

    }else if (self.SCType == SCType_None){
        
    }
}

#pragma mark - 头部按钮点击事件
- (void)titleBtnClick:(GWSegmentBtn *)button{
    [self refreshUIWithSelectBtn:button];
}

- (void)refreshUIWithSelectBtn:(GWSegmentBtn *)button{
    for (GWSegmentBtn *titleBtn in self.titleArray) {
        titleBtn.selected = NO;
        titleBtn.titleLabel.font = _titleFont;
        titleBtn.backgroundColor = _titleBtnBackColor;
    }
    button.selected = YES;
    if(_selectBtnFont!=nil){
        button.titleLabel.font = _selectBtnFont;
    }
    _selectIndex = [self.titleArray indexOfObject:button];
    if(self.selectType){
        self.selectType(_selectIndex,button.currentTitle);
    }
    
    CGFloat offsetx = (button.frame.origin.x + _selectBtnWID + _selectBtnSpace) - self.scrollView.frame.size.width + _selectBtnWID;
    CGFloat offsetMax = self.scrollView.contentSize.width - self.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetx, self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:offset animated:YES];
    
    if(self.SCType == SCType_Underline){
        //下划线
        [UIView animateWithDuration:_animateDuration animations:^{
            self.stateView.frame = CGRectMake(button.frame.origin.x, self.frame.size.height - _SCType_Underline_HEI, _selectBtnWID, _SCType_Underline_HEI);
        }];
    }else if(self.SCType == SCType_Dot){
        [UIView animateWithDuration:_animateDuration animations:^{
            self.stateView.frame = CGRectMake(button.frame.origin.x + (_selectBtnWID - _SCType_Underline_HEI)/2, self.frame.size.height - _SCType_Underline_HEI, _SCType_Underline_HEI, _SCType_Underline_HEI);
        }];
    }else if(self.SCType == SCType_Ellipse){
        [UIView animateWithDuration:_animateDuration animations:^{
            self.stateView.frame = CGRectMake(button.frame.origin.x, 0, _selectBtnWID, self.frame.size.height);
        }];
    }else if (self.SCType == SCType_SelectChange){
        
    }else if (self.SCType == SCType_BorderStyle){
        [UIView animateWithDuration:_animateDuration animations:^{
            button.backgroundColor = _titleColor;
        }];
    }else if (self.SCType == SCType_None){
        
    }
}

- (void)setAnimateDuration:(CGFloat)animateDuration{
    _animateDuration = animateDuration;
}

- (void)setSCType_Underline_HEI:(CGFloat)SCType_Underline_HEI{
    _SCType_Underline_HEI = SCType_Underline_HEI;
    GWSegmentBtn *selectBtn = (GWSegmentBtn *)self.scrollView.subviews[_selectIndex];
    if(self.SCType == SCType_Underline){
        self.stateView.frame = CGRectMake(selectBtn.frame.origin.x, self.frame.size.height - _SCType_Underline_HEI, _selectBtnWID, _SCType_Underline_HEI);
    }else if(self.SCType == SCType_Dot){
        self.stateView.frame = CGRectMake(selectBtn.frame.origin.x + (_selectBtnWID - _SCType_Underline_HEI)/2, self.frame.size.height - _SCType_Underline_HEI, _SCType_Underline_HEI, _SCType_Underline_HEI);
        self.stateView.layer.cornerRadius = _SCType_Underline_HEI/2;
    }else if(self.SCType == SCType_Ellipse){
        self.stateView.layer.cornerRadius = _cornerRadius;
        self.layer.cornerRadius = _cornerRadius;
    }
}

- (void)setEllipseBackColor:(UIColor *)ellipseBackColor{
    _ellipseBackColor = ellipseBackColor;
    if(self.SCType == SCType_Ellipse){
        self.stateView.backgroundColor = _ellipseBackColor;
    }
}

- (NSMutableArray *)titleArray{
    if(_titleArray==nil){
        _titleArray = [[NSMutableArray alloc]init];
    }
    return _titleArray;
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    if(self.SCType == SCType_Ellipse){
        self.stateView.layer.cornerRadius = _cornerRadius;
        self.layer.cornerRadius = _cornerRadius;
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    if(selectIndex >self.titleArray.count || selectIndex<0) return;
    _selectIndex = selectIndex;
    GWSegmentBtn *button = self.titleArray[selectIndex];
    [self refreshUIWithSelectBtn:button];
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView == self.scrollView){
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
