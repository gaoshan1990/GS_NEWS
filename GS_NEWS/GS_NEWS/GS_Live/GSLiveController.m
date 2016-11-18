//
//  GSLiveController.m
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.
//

#import "GSLiveController.h"

@interface GSLiveController ()
@property(nonatomic,strong) UIScrollView *topScrollview;

@end

@implementation GSLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor redColor];
    self.topScrollview =[[UIScrollView alloc] init];
    self.topScrollview.frame =CGRectMake(100, 100, 200, 40);
    [self.view addSubview:self.topScrollview];
    self.topScrollview.backgroundColor =[UIColor greenColor];
    self.topScrollview.contentSize = CGSizeMake(1000, 0);
    self.topScrollview.showsHorizontalScrollIndicator =YES;
    self.topScrollview.showsVerticalScrollIndicator =YES;
    
  
    self.topScrollview.bounces =NO;
    [self.view addSubview:self.topScrollview];
    
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.topScrollview addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
