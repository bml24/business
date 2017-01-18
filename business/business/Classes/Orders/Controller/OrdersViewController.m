//
//  OrdersViewController.m
//  business
//
//  Created by yuechuang on 2017/1/13.
//  Copyright © 2017年 yuechuang. All rights reserved.
//

#import "OrdersViewController.h"

@interface OrdersViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@end

@implementation OrdersViewController

/**
 *  监听属性值发生改变时回调
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"==--====99===   %@",keyPath);
    
    CGFloat offset = self.tableView.contentOffset.y;
    CGFloat delta = offset / 64.f + 1.f;
    delta = MAX(0, delta);
    self.navigationController.navigationBar.alpha = MIN(1, delta);
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"透明导航栏";
    
    [self.view addSubview:self.tableView];
    
    //添加监听者
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
     [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.view);
     }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * CELLID = @"CELLID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    
    if(cell == nil){

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

-(UITableView*)tableView{

    if(_tableView == nil){
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
     }

    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
