//
//  skipView.m
//  TestShapeLayer
//
//  Created by most on 16/11/17.
//  Copyright © 2016年 most. All rights reserved.
//

#import "skipView.h"

@implementation skipView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.anchorPoint =CGPointMake(1, 1);
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:self.layer.anchorPoint radius:self.bounds.size.width/2 startAngle:0 endAngle:M_PI*2 clockwise:YES]; // 2.创建图形相应的UIBezierPath对象
    
    
    // 3.设置一些修饰属性
    aPath.lineWidth = 8.0;
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:0.7 alpha:1];
    [color set];
    
    [aPath stroke]; // 4.渲染，完成绘制
}

@end
