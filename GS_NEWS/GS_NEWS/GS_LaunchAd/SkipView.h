//
//  SkipView.h
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.
//
typedef void(^skip)();
#import <UIKit/UIKit.h>

@interface SkipView : UIView
@property (nonatomic,copy)skip skipClick;
@end
