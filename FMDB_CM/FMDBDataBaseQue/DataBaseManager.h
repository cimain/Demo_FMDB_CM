//
//  DataBaseManager.h
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//  管理数据库路径

#import <Foundation/Foundation.h>

@interface DataBaseManager : NSObject

///单例
+(instancetype)sharedManager;

/** 队列 */
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;

@end
