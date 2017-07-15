//
//  UserDAO.m
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import "UserDAO.h"
#import "UserDTO.h"

@implementation UserDAO

///单例
+(instancetype)sharedInstance{
    
    static UserDAO *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        //1.
        instance = [[UserDAO alloc] init];
        
    });
    return instance;
}

/*!
 *  插入数据
 *  【注意】：？？？
 */
- (BOOL)insertUserDTO:(UserDTO *)dto{
    
    __block BOOL success = NO;

    NSString *sql = [NSString stringWithFormat:@"insert into %@ (name,age,score,arr,dic,book,date,img) values (?,?,?,?,?,?,?,?)",KTable_UserName];
    
    [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        if (![db executeUpdate:sql,
              dto.name,
              @(dto.age),
              @(dto.score),
              [NSKeyedArchiver archivedDataWithRootObject:dto.arr],
              [NSKeyedArchiver archivedDataWithRootObject:dto.dic],
              [NSKeyedArchiver archivedDataWithRootObject:dto.book],
              dto.date,
               UIImagePNGRepresentation(dto.img)]) {
            
            *rollback = YES;
            return ;
        }
        
        success = YES;
    }];
    
    return success;
}

/*!
 *  获取数据
 */
- (NSMutableArray *)loadUserData{

    NSString *sql = [NSString stringWithFormat:@"select * from %@",KTable_UserName];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        
       FMResultSet *re = [db executeQuery:sql];
        
        while ([re next]) {
            
            UserDTO *dto = [[UserDTO alloc] init];
            dto.name = [re stringForColumn:@"name"];
            dto.age = [re intForColumn:@"age"];
            dto.score = [re doubleForColumn:@"score"];
            dto.arr = [NSKeyedUnarchiver unarchiveObjectWithData:[re dataForColumn:@"arr"]];
            dto.dic = [NSKeyedUnarchiver unarchiveObjectWithData:[re dataForColumn:@"dic"]];
            dto.book = [NSKeyedUnarchiver unarchiveObjectWithData:[re dataForColumn:@"book"]];
            dto.date = [re dateForColumn:@"date"];
            dto.img = [UIImage imageWithData:[re dataForColumn:@"img"]];
            
            [arrM addObject:dto];
            
             NSLog(@"名字 = %@",dto.name);
             NSLog(@"数组 = %@",dto.arr);
             NSLog(@"字典 = %@",dto.dic);
             NSLog(@"BOOK = %@",dto.book);
             NSLog(@"时间 = %@",dto.date);
        }
    }];

    return arrM;
}

/*!
 *  修改数据
 * 【注意】
    1.这个参数，可要又不要，最好要，然后把新的模型赋值过去
    2.修改两个值的格式是： set a = 'a' , b = 'b'  一定不要少了中间的逗号
    3.是单引号，不可使用双引号，所有的都是
 */
- (BOOL)updateUserDTO:(UserDTO *)dto{

    __block BOOL success = NO;
    
    NSString *sql = [NSString stringWithFormat:@"update %@ set name = '%@',score = '%@'",KTable_UserName,@"郭美美",@(100)];

    [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        if (![db executeUpdate:sql]) {
            
            *rollback = YES;
            return ;
        }
        
        success = YES;
    }];

    return success;
}

/*!
 *  删除某个模型  （简单）
 */
- (BOOL)deleteUserDTO:(UserDTO *)dto{

    __block BOOL success = NO;
    
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where name = '%@'",KTable_UserName, dto.name];
    
    [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        if (![db executeUpdate:sql]) {
            
            *rollback = YES;
            return ;
        }
        
        success = YES;
    }];
    
    return success;
}


/*!
 *  删除某个模型  （简单）
 */
- (BOOL)deleteAllUserDTO{
    
    __block BOOL success = NO;
    
    NSString *sql = [NSString stringWithFormat:@"delete from %@",KTable_UserName];
    
    [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        if (![db executeUpdate:sql]) {
            
            *rollback = YES;
            return ;
        }
        
        success = YES;
    }];
    
    return success;
}

@end
