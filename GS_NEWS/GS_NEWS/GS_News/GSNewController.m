//
//  GSNewController.m
//  GS_NEWS
//
//  Created by most on 16/11/18.
//  Copyright © 2016年 most. All rights reserved.

#import "GSNewController.h"
static NSInteger const  btnW =100;

@interface GSNewController ()
@property(nonatomic,strong) UIScrollView *topScrollview;
@property(nonatomic,strong)NSMutableArray *scrollviewArray;
@end

@implementation GSNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavi];
    [self initScrollView];
    self.view.clipsToBounds = NO;

}

- (void)initNavi
{
    
}
-(void)initScrollView
{
    self.topScrollview =[[UIScrollView alloc] init];
    self.topScrollview.frame =CGRectMake(0, 0, self.view.bounds.size.width, 40);
    [self.view addSubview:self.topScrollview];
    self.topScrollview.backgroundColor =[UIColor greenColor];
    

    for (int i=0;i<self.scrollviewArray.count;i++) {
        
        UIButton *titleBtn =[[UIButton alloc] init];
        [titleBtn setTitle:self.scrollviewArray[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        titleBtn.frame =CGRectMake(btnW*i, 0, btnW, self.topScrollview.bounds.size.height);
        [self.topScrollview addSubview:titleBtn];
        
    }
    
    self.topScrollview.contentSize =CGSizeMake(btnW*self.scrollviewArray.count,0);
    
    UIButton *addBtn =[[UIButton alloc] init];
    
    addBtn.frame =CGRectMake(self.topScrollview.bounds.size.width-self.topScrollview.bounds.size.height, 0, self.topScrollview.bounds.size.height, self.topScrollview.bounds.size.height);
    addBtn.backgroundColor =[UIColor blueColor];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    
}
- (void)addBtnClick
{
    UIView *test =[[UIView alloc]init];
     test.frame =CGRectMake(0, 0, self.view.bounds.size.width, 0);
    test.backgroundColor =[UIColor yellowColor];
    
    [UIView animateWithDuration:0.8 animations:^{
      
        test.frame = self.view.bounds;
    }];

    [self.view addSubview:test];


}
-(NSMutableArray *)scrollviewArray
{
    if (!_scrollviewArray) {
        _scrollviewArray =[NSMutableArray array];
        [_scrollviewArray addObject:@"新闻"];
        [_scrollviewArray addObject:@"新闻2"];

        [_scrollviewArray addObject:@"新闻3"];

        [_scrollviewArray addObject:@"新闻4"];


    }
    return _scrollviewArray;
}

@end
