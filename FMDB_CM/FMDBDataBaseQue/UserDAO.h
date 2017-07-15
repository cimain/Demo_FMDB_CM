//
//  UserDAO.h
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DAO,UserDTO;

@interface UserDAO : DAO     //一定要继承DAO，不然self点不出来databaseQueue的

///单例
+(instancetype)sharedInstance;

/*!
 *  插入数据
 */
- (BOOL)insertUserDTO:(UserDTO *)dto;

/*!
 *  获取数据
 */
- (NSMutableArray *)loadUserData;

/*!
 *  修改数据
 */
- (BOOL)updateUserDTO:(UserDTO *)dto;

/*!
 *  删除某个模型
 */
- (BOOL)deleteUserDTO:(UserDTO *)dto;

- (BOOL)deleteAllUserDTO;

@end
