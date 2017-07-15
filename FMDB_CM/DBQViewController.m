//
//  DBQViewController.m
//  FMDB_CM
//
//  Created by ChenMan on 2017/7/14.
//  Copyright © 2017年 ChenMan. All rights reserved.
//

#import "DBQViewController.h"
#import "DBQTableViewCell.h"
#import "DAO.h"
#import "UserDTO.h"
#import "BookDTO.h"
#import "UserDAO.h"

static NSString *cellId = @"DBQcell";

@interface DBQViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *  数据源
 */
@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation DBQViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [DAO creatTableIfNeed];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清除全表" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllData)];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.dataArray = [[UserDAO sharedInstance] loadUserData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 129;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DBQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DBQTableViewCell class]) owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    UserDTO *person = self.dataArray[indexPath.row];
    
    cell.cellMdl = person;
    
    return cell;
    
}



/**
 *  设置删除按钮
 *
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        UserDTO *person = self.dataArray[indexPath.row];
        
        if ([[UserDAO sharedInstance] deleteUserDTO:person]) {
            NSLog(@"删除成功");
        }else{
            NSLog(@"删除失败");
        }
        
        self.dataArray = [[UserDAO sharedInstance] loadUserData];
        [self.tableView reloadData];
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Action
/**
 *  添加数据到数据库
 */
- (void)addData{
    
    NSLog(@"addData");
    
    int nameRandom = arc4random_uniform(1000);
    NSInteger ageRandom  = arc4random_uniform(100) + 1;
    
    
    NSString *name = [NSString stringWithFormat:@"person_%d号",nameRandom];
    NSInteger age = ageRandom;
    
    
    
    NSArray *arrr = @[@"t1",@"t2",@"t3"];
    
    NSDictionary *dic = @{@"key":@"t123"};
    
    BookDTO *bDto = [BookDTO bookWithBookName:@"NewBook" bookId:0011];
    
    UIImage *imag = [UIImage imageNamed:@"1"];
    
    NSLog(@"date = %@",[NSDate date]);
    //2016-05-11 10:04:50 +0000
    //2016-05-11 10:05:40 +0000  13
    //2016-05-11 10:06:01 +0000    31
    
    UserDTO *dto = [UserDTO userWithUserName:name userAge:age userScore:9 arr:arrr dic:dic book:bDto date:[NSDate date] image:imag];
    
    if ([[UserDAO sharedInstance] insertUserDTO:dto]) {
        
        NSLog(@"插入成功");
    }else{
        
        NSLog(@"插入失败");
    }
    
    self.dataArray = [[UserDAO sharedInstance] loadUserData];
    [self.tableView reloadData];
    
}

- (void)deleteAllData{
    if ([[UserDAO sharedInstance] deleteAllUserDTO]) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
    self.dataArray = [[UserDAO sharedInstance] loadUserData];
    [self.tableView reloadData];
}

#pragma mark - Getter
- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        
    }
    return _dataArray;
    
}

@end
