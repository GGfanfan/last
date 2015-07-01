//
//  ViewController.m
//  last
//
//  Created by ses on 15/7/1.
//  Copyright (c) 2015年 上海壹嫂网络科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "SmallViewViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,TableViewCellDelegat>
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation ViewController

-(void)initData{
    _dataArr=@[@[@"a",@"b",@"c"],@[@"d",@"b",@"c"],@[@"h",@"b",@"c"],@[@"j",@"b",@"c"],@[@"k",@"b",@"c"]];
    _titleArr=@[@"a",@"d",@"h",@"j",@"k"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData ];
    [self configTableView];
}
-(void)configView:(CGFloat)wigth btn:(UIButton *)btn{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 30,wigth,0)];
    view.backgroundColor=[UIColor redColor];
    [btn addSubview:view];
    [btn bringSubviewToFront:view];
    [UIView beginAnimations:@"a" context:nil];
    [UIView setAnimationDelay:0.1];
    view.frame=CGRectMake(0, 30, wigth, 300);
    [UIView commitAnimations];
    
    
    
}

-(void)configTableView{
    _tabelView.delegate=self;
    _tabelView.dataSource=self;
    [_tabelView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
    _tabelView.scrollEnabled=NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataArr count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArr[section] count] ;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _titleArr[section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _titleArr;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    cell.str=_dataArr[indexPath.section][indexPath.row];
    
//    cell.showView=^(CGFloat w,UIButton *sender){
//        [self configView:w btn:sender];
//    };
    cell.delegat=self;
    
    return cell;
}
-(void)showView:(NSNumber *)wight btn:(UIButton *)button {
    NSLog(@"a");
    CGFloat ff=[wight intValue];
    NSLog(@"%f",ff);
    NSLog(@"%d",button.tag);
    [self configView:ff btn:button];
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
