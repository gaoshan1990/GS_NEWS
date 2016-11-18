//
//  SkipView.m
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.
//



#import "SkipView.h"

@interface SkipView()
@property (nonatomic,strong) NSTimer *timer;

@end
@implementation SkipView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self =[super initWithFrame:frame]) {
        
   
  self.timer =[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateCycle) userInfo:nil repeats:YES];
    
    }
    return self;
    
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 startAngle:-M_PI/2 endAngle:angle*M_PI*3/2 clockwise:YES];
    path.lineWidth =3;
    [[UIColor redColor] setStroke];
    [path stroke];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
   [self setupViews];
    
}
- (void)setupViews
{
    
    self.backgroundColor =[ UIColor whiteColor];
    self.layer.cornerRadius =self.bounds.size.width/2;
    self.layer.masksToBounds =YES;
    
    UIButton *skipBtn =[[UIButton alloc] init];
    skipBtn.frame =self.bounds;
    skipBtn.titleLabel.font =[UIFont systemFontOfSize:10];
    [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
    [skipBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    skipBtn.clipsToBounds =YES;
    [skipBtn addTarget:self action:@selector(skipClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:skipBtn];
}
static float angle =0.0;
-(void)updateCycle
{
    angle+=0.1;
    [self setNeedsDisplay];
    if ((int)angle==1) {
        self.skipClick();//
        
        [self.timer invalidate];
        self.timer= nil;
        return;
    }
    
}
- (void)skipClick:(UIButton *)skip
{
    [self.timer invalidate];
    self.timer= nil;
    self.skipClick();
}
@end
