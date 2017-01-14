//
//  HomeViewController.m
//  business
//
//  Created by yuechuang on 2017/1/13.
//  Copyright © 2017年 yuechuang. All rights reserved.
//

#import "HomeViewController.h"
#import "CFLineChartView.h"
#import <objc/runtime.h>
#import "ViewController.h"

@interface HomeViewController ()

@property (nonatomic,strong) UIScrollView * scroll;
@property (nonatomic, strong) CFLineChartView *LCView;
@property (nonatomic,strong)UIBarButtonItem * btnItem;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"首页标题";

    [self.view addSubview:self.scroll];
    [self.scroll addSubview:self.LCView];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: self.btnItem,nil]];
    
    self.scroll.frame = CGRectMake(0, 64, SCREEN_WIDTH,300);
    self.scroll.contentSize = CGSizeMake(SCREEN_WIDTH*2, 300);
    
    [self setupConditions];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(UIScrollView*)scroll{

    if(_scroll == nil){
    
        _scroll = [[UIScrollView alloc]init];
        _scroll.backgroundColor = [UIColor blueColor];
        _scroll.showsVerticalScrollIndicator = YES;
        _scroll.showsHorizontalScrollIndicator = YES;
        //如果你不想让scroll view的内容自动调整，将这个属性设为NO（默认值YES）。
        self.automaticallyAdjustsScrollViewInsets = NO;
      
    }

    return _scroll;
}

-(CFLineChartView*)LCView{

    if(_LCView == nil){
    
        _LCView = [CFLineChartView lineChartViewWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds)*2 - 20, 300)];
        _LCView.xValues = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14];
        _LCView.yValues = @[@35, @5, @80, @40, @150, @13, @450, @75,@25, @100, @64, @95, @33, @100];
    }
    
    return _LCView;
}

// 设置条件
- (void)setupConditions{
    
    self.LCView.isShowLine = 1;
    self.LCView.isShowPoint = 1;
    self.LCView.isShowPillar = 1;
    self.LCView.isShowValue = 1;
    
    [self.LCView drawChartWithLineChartType:0 pointType:0];
    
    
}

-(UIBarButtonItem*)btnItem{

    if(_btnItem == nil){
        
        _btnItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Dome", nil) style:UIBarButtonItemStylePlain target:self action:@selector(registerClick)];
    }
    return _btnItem;
}


-(void)registerClick{

    DebugLog(@"register");
    
    
    ViewController * Controller = [[ViewController alloc]init];
    __weak HomeViewController * wself = self;
    
    Controller.block = ^(NSString * str,UIColor * color){
    
        DebugLog(@"======  %@",str);
        wself.view.backgroundColor = color;
    
    };
    
    [self.navigationController pushViewController:Controller animated:YES];

}
@end
