//
//  ViewController.m
//  GWSegmentedControl
//
//  Created by gw on 2017/1/22.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "ViewController.h"
#import "GWSegmentedControl.h"

#define ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define ScreenWidth    [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self UnixTimeStamp];
    [self uiConfig];
}

- (void)uiConfig{
    NSArray *titleArr = @[@"按钮一",@"按钮二",@"按钮三",@"按钮四",@"按钮五",@"按钮六",@"按钮七",@"按钮八"];
    NSArray *iconArr20 = @[@"icon1",@"icon2",@"icon3",@"icon4",@"icon5",@"icon6",@"icon7",@"icon8"];
    NSArray *iconArr30 = @[@"icon9",@"icon10",@"icon11",@"icon12",@"icon13",@"icon14",@"icon15",@"icon16"];
  //1.
    GWSegmentedControl *zvc = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_Underline];
    zvc.frame = CGRectMake((ScreenWidth - 300)/2, 35, 300, 40);
    zvc.backgroundColor = [UIColor whiteColor];
    zvc.titleColor = [UIColor lightGrayColor];
    zvc.selectBtnSpace = 5;//设置按钮间的间距
    zvc.selectBtnWID = 70;//设置按钮的宽度 不设就是均分
    zvc.SCType_Underline_HEI = 2;//设置底部横线的高度
    zvc.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    [zvc startLoading];
    zvc.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc];
  
    //2.
    GWSegmentedControl *zvc4 = [[GWSegmentedControl alloc]initwithTitleArr:nil iconArr:iconArr30 selectIconArr:nil SCType:SCType_Dot];
    zvc4.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc.frame) + 40, 300, 40);
    zvc4.backgroundColor = [UIColor whiteColor];
    zvc4.titleColor = [UIColor lightGrayColor];
    zvc4.selectBtnSpace = 5;//设置按钮间的间距
    zvc4.selectBtnWID = 70;//设置按钮的宽度 不设就是均分
    zvc4.SCType_Underline_HEI = 4;
    zvc4.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    [zvc4 startLoading];
    zvc4.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
//        zvc.selectIndex = selectIndex;
    };
    [self.scrollView addSubview:zvc4];
    
    //3.
    GWSegmentedControl *zvc5 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:iconArr20 selectIconArr:nil SCType:SCType_Underline];
    zvc5.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc4.frame) + 40, 300, 40);
    zvc5.backgroundColor = [UIColor whiteColor];
    zvc5.titleColor = [UIColor lightGrayColor];
    zvc5.selectBtnSpace = 5;//设置按钮间的间距
    zvc5.selectBtnWID = 70;//设置按钮的宽度 不设就是均分
    zvc5.SCType_Underline_HEI = 2;
    zvc5.edgeInsetsStyle = ZFJButtonEdgeInsetsStyleTop;
    //top, left, bottom, right
    zvc5.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:14];
    [zvc5 startLoading];
    zvc5.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc5];
    
    
    //4.
    NSArray *myTitleArr = @[@"按钮一",@"按钮二",@"按钮三"];
    GWSegmentedControl *zvc11 = [[GWSegmentedControl alloc]initwithTitleArr:myTitleArr iconArr:iconArr20 selectIconArr:nil SCType:SCType_BorderStyle];
    zvc11.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc5.frame) + 40, 300, 40);
    zvc11.backgroundColor = [UIColor whiteColor];
    zvc11.titleColor = [UIColor colorWithRed:0.655 green:0.204 blue:0.890 alpha:1.00];
    zvc11.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    zvc11.selectBtnFont = [UIFont boldSystemFontOfSize:14];
    zvc11.selectTitleColor = [UIColor whiteColor];
    zvc11.borderWidth = 1.0;
    zvc11.titleBtnBackColor = [UIColor whiteColor];
    //zvc11.selectBtnWID = 70;
    zvc11.edgeInsetsStyle = ZFJButtonEdgeInsetsStyleLeft;
    [zvc11 startLoading];
    zvc11.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc11];
    
    
    //5.
    GWSegmentedControl *zvc12 = [[GWSegmentedControl alloc]initwithTitleArr:myTitleArr iconArr:iconArr20 selectIconArr:nil SCType:SCType_BorderStyle];
    zvc12.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc11.frame) + 40, 300, 40);
    zvc12.backgroundColor = [UIColor whiteColor];
    zvc12.titleColor = [UIColor colorWithRed:0.655 green:0.204 blue:0.890 alpha:1.00];
    zvc12.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    zvc12.selectBtnFont = [UIFont boldSystemFontOfSize:14];
    zvc12.selectTitleColor = [UIColor whiteColor];
    zvc12.borderWidth = 1.0;
    zvc12.titleBtnBackColor = [UIColor whiteColor];
    //zvc11.selectBtnWID = 70;
    zvc12.edgeInsetsStyle = ZFJButtonEdgeInsetsStyleRight;
    [zvc12 startLoading];
    zvc12.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc12];
    
    
    //6.
    GWSegmentedControl *zvc13 = [[GWSegmentedControl alloc]initwithTitleArr:myTitleArr iconArr:iconArr20 selectIconArr:nil SCType:SCType_BorderStyle];
    zvc13.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc12.frame) + 40, 300, 40);
    zvc13.backgroundColor = [UIColor whiteColor];
    zvc13.titleColor = [UIColor colorWithRed:0.655 green:0.204 blue:0.890 alpha:1.00];
    zvc13.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    zvc13.selectBtnFont = [UIFont boldSystemFontOfSize:14];
    zvc13.selectTitleColor = [UIColor whiteColor];
    zvc13.borderWidth = 1.0;
    zvc13.titleBtnBackColor = [UIColor whiteColor];
    //zvc11.selectBtnWID = 70;
    zvc13.edgeInsetsStyle = ZFJButtonEdgeInsetsStyleBottom;
    [zvc13 startLoading];
    zvc13.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc13];
    
    
    //7.
    GWSegmentedControl *zvc2 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_Dot];
    zvc2.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc13.frame) + 40, 300, 40);
    zvc2.backgroundColor = [UIColor whiteColor];
    zvc2.titleColor = [UIColor lightGrayColor];//按钮的默认颜色
    zvc2.selectBtnSpace = 5;//按钮之间的间距
    zvc2.selectBtnWID = 70;//按钮的宽度
    zvc2.SCType_Underline_HEI = 4;//圆点的直径
    zvc2.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    [zvc2 startLoading];
    zvc2.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc2];
    
    
    //8.
    GWSegmentedControl *zvc3 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_Ellipse];
    zvc3.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc2.frame) + 40, 300, 40);
    zvc3.backgroundColor = [UIColor whiteColor];
    zvc3.titleColor = [UIColor lightGrayColor];
    zvc3.selectBtnSpace = 5;
    zvc3.selectBtnWID = 70;
    zvc3.cornerRadius = 20;//椭圆的圆角
    zvc3.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    [zvc3 startLoading];
    zvc3.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc3];
    
    
    //9.
    GWSegmentedControl *zvc6 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_Ellipse];
    zvc6.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc3.frame) + 40, 300, 40);
    zvc6.backgroundColor = [UIColor whiteColor];
    zvc6.titleColor = [UIColor blackColor];
    zvc6.selectTitleColor = [UIColor redColor];
    zvc6.selectBtnSpace = 5;
    zvc6.selectBtnWID = 70;
    zvc6.cornerRadius = 20;//椭圆的圆角
    zvc6.ellipseBackColor = [UIColor yellowColor];
    zvc6.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    [zvc6 startLoading];
    zvc6.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc6];
    
    
    //10.
    myTitleArr = @[@"按钮一",@"按钮二",@"按钮三",@"按钮四",@"按钮五"];
    GWSegmentedControl *zvc10 = [[GWSegmentedControl alloc]initwithTitleArr:myTitleArr iconArr:nil selectIconArr:nil SCType:SCType_BorderStyle];
    zvc10.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc6.frame) + 40, 300, 40);
    zvc10.backgroundColor = [UIColor whiteColor];
    zvc10.titleColor = [UIColor colorWithRed:0.655 green:0.204 blue:0.890 alpha:1.00];
    zvc10.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    zvc10.selectBtnFont = [UIFont boldSystemFontOfSize:14];
    zvc10.selectTitleColor = [UIColor whiteColor];
    zvc10.borderWidth = 1.0;
    zvc10.titleBtnBackColor = [UIColor whiteColor];
    [zvc10 startLoading];
    zvc10.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc10];
    
    
    //11.
    GWSegmentedControl *zvc7 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_None];
    zvc7.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc10.frame) + 40, 300, 40);
    zvc7.backgroundColor = [UIColor whiteColor];
    zvc7.titleColor = [UIColor lightGrayColor];
    zvc7.selectBtnSpace = 5;//设置按钮间的间距
    zvc7.selectBtnWID = 70;//设置按钮的宽度 不设就是均分
    zvc7.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:16];//按钮的常态样式
    zvc7.selectBtnFont = [UIFont boldSystemFontOfSize:20];//按钮的选中状态的样式
    [zvc7 startLoading];
    zvc7.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc7];
    
    
    //12.
    GWSegmentedControl *zvc8 = [[GWSegmentedControl alloc]initwithTitleArr:titleArr iconArr:nil selectIconArr:nil SCType:SCType_Ellipse];
    zvc8.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc7.frame) + 40, 300, 40);
    zvc8.backgroundColor = [UIColor whiteColor];
    zvc8.titleColor = [UIColor lightGrayColor];
    zvc8.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:14];
    zvc8.selectBtnFont = [UIFont boldSystemFontOfSize:18];
    zvc8.selectBtnSpace = 5;
    zvc8.selectBtnWID = 70;
    //zvc8.cornerRadius = 0;//椭圆的圆角
    [zvc8 startLoading];
    zvc8.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc8];
    
    
    //13.
    GWSegmentedControl *zvc9 = [[GWSegmentedControl alloc]initwithTitleArr:myTitleArr iconArr:nil selectIconArr:nil SCType:SCType_None];
    zvc9.frame = CGRectMake((ScreenWidth - 300)/2, CGRectGetMaxY(zvc8.frame) + 40, 300, 40);
    zvc9.backgroundColor = [UIColor whiteColor];
    zvc9.titleColor = [UIColor lightGrayColor];
    zvc9.titleFont = [UIFont fontWithName:@"STHeitiSC-Light" size:14];
    zvc9.selectBtnFont = [UIFont boldSystemFontOfSize:18];
    [zvc9 startLoading];
    zvc9.selectType = ^(NSInteger selectIndex,NSString *selectIndexTitle){
        NSLog(@"selectIndexTitle == %@",selectIndexTitle);
        self.textLabel.text = [NSString stringWithFormat:@"index = %ld,buttonTitle = %@",selectIndex,selectIndexTitle];
    };
    [self.scrollView addSubview:zvc9];
}

- (void)UnixTimeStamp{
    self.view.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.00];
    
    self.textLabel = [[UILabel alloc]init];
    self.textLabel.backgroundColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.frame = CGRectMake( 0, ScreenHeight - 40, ScreenWidth, 40);
    [self.view addSubview:self.textLabel];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.contentSize = CGSizeMake(0, ScreenHeight * 2);
    self.scrollView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 40);
    [self.view addSubview:self.scrollView];
    
    NSArray *textArr = @[@"1.下划线样式，只有文字",
                         @"2.圆点样式，只有图片",
                         @"3.图片在文字的上面",
                         @"4.图片在文字的左边",
                         @"5.图片在文字的右边",
                         @"6.图片在文字的下边",
                         @"7.圆点样式，设置了按钮的宽度和间距",
                         @"8.椭圆背景，设置了按钮的宽度和间距",
                         @"9.自定义椭圆背景的样式，可以设置椭圆的圆角",
                         @"10.设置边，填充样式",
                         @"11.没有下面的跟随状态，自定义选中按钮的样式",
                         @"12.方块背景，设置椭圆的圆角为0",
                         @"13.没有设置按钮的宽度和样式，自动均分"
                         ];
    for (int i = 0; i<textArr.count; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:14];
        label.text = textArr[i];
        label.frame = CGRectMake((ScreenWidth - 300)/2, 15 + 80 * i, 300, 20);
        [self.scrollView addSubview:label];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
