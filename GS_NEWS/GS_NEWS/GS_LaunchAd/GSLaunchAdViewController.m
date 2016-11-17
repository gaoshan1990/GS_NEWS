//
//  GSLaunchAdViewController.m
//  GS_NEWS
//
//  Created by most on 16/11/17.
//  Copyright © 2016年 most. All rights reserved.
//


#import "GSLaunchAdViewController.h"
#define KSCREENWIDTH      [UIScreen mainScreen].bounds.size.width
#define KSCREENHEIGHT     [UIScreen mainScreen].bounds.size.height

@interface GSLaunchAdViewController ()
@property(nonatomic,strong)UIImageView *lanuchImageView;
@property(nonatomic,strong)UIImageView *adImageView;
@property(nonatomic,assign)CGRect adFrame;
@property(nonatomic,strong)UIButton *skipButton;
@end

@implementation GSLaunchAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

+(void)showAdViewControllerWithFrame:(CGRect)frame setAdImage:(setAdImageBlock)adImage showFinish:(showFinishBlock)showFinish
{
    GSLaunchAdViewController * launch= [GSLaunchAdViewController alloc];
    
    [[UIApplication sharedApplication].delegate window].rootViewController =launch;
    
    if (adImage) {
        adImage(launch);
    }
    
    [launch initWithFrame:frame showFinish:showFinish];
}


#pragma --初始化
-(void)initWithFrame:(CGRect)frame showFinish:(void(^)())showFinish
{
    _adFrame =frame;
    
    
   
    [self addSubviews];
    
}


-(void)addSubviews
{
    [self.view addSubview:self.lanuchImageView];
    [self.view addSubview:self.adImageView];
    [self.adImageView addSubview:self.skipButton];
    
}

- (UIButton *)skipButton
{
    if (!_skipButton) {
        _skipButton =[[UIButton alloc] init];
        _skipButton.layer.cornerRadius =10;
        _skipButton.layer.borderWidth=1;
        _skipButton.frame =CGRectMake(KSCREENWIDTH-60, 20, 40, 20);
    }

    return _skipButton;
}
#pragma --添加启动图的imageview
-(UIImageView *)lanuchImageView
{
    if (!_lanuchImageView) {
        _lanuchImageView =[[UIImageView alloc] init];
        _lanuchImageView.frame =[UIScreen mainScreen].bounds;
        _lanuchImageView.image =[self getLaunchImages];
    }
    return _lanuchImageView;
}
#pragma --得到启动图
-(UIImage *)getLaunchImages
{
    UIImage *imageP = [self launchImageWithType:@"Portrait"];
    if(imageP) return imageP;
    UIImage *imageL = [self launchImageWithType:@"Landscape"];
    if(imageL) return imageL;
    NSLog(@"获取LaunchImage失败!请检查是否添加启动图,或者规格是否有误.");
    return nil;
}
-(UIImage *)launchImageWithType:(NSString *)type
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if([viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            if([dict[@"UILaunchImageOrientation"] isEqualToString:@"Landscape"])
            {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if(CGSizeEqualToSize(imageSize, viewSize))
            {
                launchImageName = dict[@"UILaunchImageName"];
                UIImage *image = [UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
}
#pragma --广告图imageview
-(UIImageView *)adImageView
{
    if (!_adImageView) {
        _adImageView =[[UIImageView alloc] init];
        _adImageView.frame =CGRectMake(0, 0, self.adFrame.size.width, self.adFrame.size.height-150);
    }
    return _adImageView;
}
@end
