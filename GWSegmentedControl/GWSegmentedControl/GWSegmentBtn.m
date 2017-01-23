//
//  GWSegmentBtn.m
//  说说TV
//
//  Created by gw on 2017/1/22.
//  Copyright © 2017年 杨学浩. All rights reserved.
//

#import "GWSegmentBtn.h"

@implementation GWSegmentBtn

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    switch (_edgeStyle) {
        case GWButtonTop:{
            return CGRectMake(0, 25, self.frame.size.width, 15);
        }
            break;
        case GWButtonLeft:{
            return CGRectMake(25, 0, self.bounds.size.width-25, self.bounds.size.height);
        }
            break;
        case GWButtonRight:{
            return CGRectMake(0, 0, self.frame.size.width-25, self.frame.size.height);
        }
            break;
        case GWButtonBottom:{
            return CGRectMake(0, 0, self.frame.size.width, 15);
        }
            break;
        case GWButtonNone:{
            return contentRect;
        }
            break;
        default:
            break;
    }
    return contentRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    switch (_edgeStyle) {
        case GWButtonTop:{
             return CGRectMake(0, 5, self.frame.size.width, 20);
        }
            break;
        case GWButtonLeft:{
            return CGRectMake(5, self.frame.size.height/2-10, 20, 20);
        }
            break;
        case GWButtonRight:{
            return CGRectMake(self.frame.size.width-25, self.frame.size.height/2-10, 20, 20);
        }
            break;
        case GWButtonBottom:{
            return CGRectMake(0, 20, self.frame.size.width, 20);
        }
            break;
        case GWButtonNone:{
            return contentRect;
        }
            break;
        default:
            break;
    }
    return contentRect;
}

@end
