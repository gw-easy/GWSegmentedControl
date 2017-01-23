//
//  GWSegmentBtn.h
//  说说TV
//
//  Created by gw on 2017/1/22.
//  Copyright © 2017年 杨学浩. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, GWButtonStyle) {
    GWButtonTop = 1,    // image在上，label在下
    GWButtonLeft,   // image在左，label在右
    GWButtonBottom, // image在下，label在上
    GWButtonRight,  // image在右，label在左
    GWButtonNone    //如果设置的不合适可以自己设置
};
@interface GWSegmentBtn : UIButton
@property (assign,nonatomic)GWButtonStyle edgeStyle;

@end
