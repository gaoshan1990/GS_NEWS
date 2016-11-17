//
//  ViewController.m
//  TestShapeLayer
//
//  Created by most on 16/11/17.
//  Copyright © 2016年 most. All rights reserved.
//

#import "ViewController.h"
#import "skipView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
    skipView  *vi =[[skipView alloc] init];
    
    vi.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:vi];
    
   
    
    
    
}

@end
