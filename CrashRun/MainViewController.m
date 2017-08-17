//
//  MainViewController.m
//  CrashRun
//
//  Created by ZZG on 17/7/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,NSMachPortDelegate>

@property (nonatomic, strong) NSMutableArray *rData;
@property (nonatomic, weak) UITableView *myTableView;
@end

@implementation MainViewController

-(NSMutableArray *)rData {
    if (_rData == nil) {
        _rData = [NSMutableArray new];
    }
    return _rData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 100, 150, 50);
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"数组越界异常" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(arrayClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, CGRectGetMaxY(btn1.frame) + 10, 150, 50);
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"信号错误捕获" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(singalClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, CGRectGetMaxY(btn2.frame) + 10, 150, 50);
    btn3.backgroundColor = [UIColor redColor];
    [btn3 setTitle:@"网络请求异常" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(netClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn3.frame), self.view.bounds.size.width, self.view.bounds.size.height -CGRectGetMaxY(btn3.frame) ) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    self.myTableView = table;
    
    
    NSMachPort *  port = [[NSMachPort alloc]init];    //#1
    [port setDelegate:self];                          //#2
    [[NSRunLoop currentRunLoop] addPort:port forMode:NSRunLoopCommonModes];//#3
    
    [NSThread detachNewThreadSelector:@selector(newThread:) toTarget:self withObject:port]; //#4
}


- (void)handleMachMessage:(void *)msg{   //#5
    NSLog(@"hello wrod%s",msg);          //#6
    
}

-(void)newThread:(NSMachPort *)sender{
    NSMachPort *p = [[NSMachPort alloc]init];   //#7
    [sender sendBeforeDate:[NSDate distantFuture] components:nil from:p reserved:0];//#8
    NSLog(@"subthread=%@",[NSThread currentThread]);
}


/**
 数组越界处理
 */
-(void)arrayClick {
    NSArray * arys = @[@"2",@"3"];
    NSLog(@"-----##%@",arys[2]);
}

/**
 信号错误
 */
-(void)singalClick {
    [self performSelector:@selector(aaaaa)];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"#####################:%@",[NSThread currentThread]);
}

/**
 网络请求
 */
-(void)netClick {
   NSString * path = [[NSBundle mainBundle]pathForResource:@"loginJson.json" ofType:nil];
    NSData *JSONData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dataArray = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
//    NSMutableArray *newArray = [NSMutableArray array];
    for (NSDictionary *dict in dataArray[@"data"][@"list"]) {
        NSLog(@"----#############----------%@",[NSThread currentThread]);
        [self.rData addObject:dict[@"hbgxName"]];
        NSLog(@"----****************----------");
    }
//    NSLog(@"----###____%@",newArray);
    
//    self.label4.text = @"ffffffffffffffff";
    [self.myTableView reloadData];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
static NSString * ID = @"ID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.rData[indexPath.row];
    return cell;
}

@end
