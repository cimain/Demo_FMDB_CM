//
//  DAO.h
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAO : NSObject

/** 队列 */
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;

/*!
 *  创建表
 */
+ (void)creatTableIfNeed;

@end
