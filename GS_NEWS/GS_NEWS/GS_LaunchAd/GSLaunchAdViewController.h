//
//  GSLaunchAdViewController.h
//  GS_NEWS
//
//  Created by most on 16/11/17.
//  Copyright © 2016年 most. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GSLaunchAdViewController;

//将GS_LaunchAdViewController 传出去
typedef void (^setAdImageBlock)(GSLaunchAdViewController *LaunchAdViewController);
typedef void(^showFinishBlock)();

@interface GSLaunchAdViewController : UIViewController
#pragma --初始化
+(void)showAdViewControllerWithFrame:(CGRect)frame setAdImage:(setAdImageBlock)adImage showFinish:(showFinishBlock)showFinish;
@end
