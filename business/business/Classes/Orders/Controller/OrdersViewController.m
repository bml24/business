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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"透明导航栏";
    
    [self.view addSubview:self.tableView];
    
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
