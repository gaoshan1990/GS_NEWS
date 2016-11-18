//
//  GSMainNews.m
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSMainNews.h"
#import "GSLiveController.h"
#import "GSTopicController.h"
#import "GSMeController.h"
#import "GSNewController.h"
@interface GSMainNews ()

@end

@implementation GSMainNews

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];

}

-(void)initViews
{
    
    
    GSNewController  *home =[[GSNewController alloc ] init];
    
      [self setViewControllerWithController:home andTitle:@"新闻" andNormalImageName:@"old_tabbar_icon_news_normal" andSelectImageName:@"old_tabbar_icon_news_highlight"];
    
    GSLiveController *transact =[[GSLiveController alloc]init];
    
    [self setViewControllerWithController:transact andTitle:@"直播" andNormalImageName:@"tabbar_icon_bar_normal" andSelectImageName:@"tabbar_icon_bar_highlight"];
    
    GSTopicController  *commodity =[[GSTopicController  alloc]init];
    [self setViewControllerWithController:commodity andTitle:@"话题" andNormalImageName:@"tabbar_icon_me_normal" andSelectImageName:@"tabbar_icon_me_highlight"];
    
    GSMeController *preferential =[[GSMeController alloc]init];
    
    [self setViewControllerWithController:preferential andTitle:@"我" andNormalImageName:@"tabbar_icon_media_normal" andSelectImageName:@"tabbar_icon_media_highlight"];
    
  
}

-(void)setViewControllerWithController:(UIViewController*)controller andTitle:(NSString*)title andNormalImageName:(NSString*)normalimagename andSelectImageName:(NSString*)selectimagename
{
    
    controller.tabBarItem.title =title;
    controller.tabBarItem.image =[[UIImage imageNamed:normalimagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage =[[UIImage imageNamed:selectimagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttris = [NSMutableDictionary dictionary];
    textAttris[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    textAttris[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    NSMutableDictionary *textAttrisSelected = [NSMutableDictionary dictionary];
    textAttrisSelected[NSForegroundColorAttributeName] = [UIColor redColor];
//    textAttrisSelected[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    
    [controller.tabBarItem setTitleTextAttributes:textAttris forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:textAttrisSelected forState:UIControlStateSelected];
    
    
    UINavigationController *navi =[[UINavigationController alloc]initWithRootViewController:controller];
    [navi.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor redColor]] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:navi];
    
}

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
