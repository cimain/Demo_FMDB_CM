//
//  UserDTO.h
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BookDTO;

@interface UserDTO : NSObject

/** 基本属性 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, assign) float score;

/** 数组 */
@property (nonatomic, strong) NSArray *arr;

/** 字典 */
@property (nonatomic, strong) NSDictionary *dic;

/** 自定义模型 */
@property (nonatomic, strong) BookDTO *book;

/** 时间 */
@property (nonatomic, strong) NSDate *date;

/** 图片 */
@property (nonatomic, strong) UIImage *img;


///构造器1
+ (UserDTO *)userWithUserName:(NSString *)userName
                      userAge:(NSInteger)userAge
                    userScore:(float)userScore
                          arr:(NSArray *)arr
                          dic:(NSDictionary *)dic
                         book:(BookDTO *)book
                         date:(NSDate *)date
                        image:(UIImage *)img;

@end
