//
//  DAO.m
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import "DAO.h"

@implementation DAO

- (FMDatabaseQueue *)databaseQueue{
    
    return [DataBaseManager sharedManager].databaseQueue;;
}

+ (void)creatTableIfNeed{
    
    //【注意】：以后做sql语句，()外面的参数用字符串拼，()里面的参数放在执行方法里写
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, score REAL,arr BLOB,dic BLOB,book BLOB,date,img BLOB)",KTable_UserName];
    
    [[DataBaseManager sharedManager].databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        if ([db executeUpdate:sql]) {
            
            NSLog(@"创建表成功");
        }
    }];
}

@end
