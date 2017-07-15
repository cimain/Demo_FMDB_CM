//
//  Person.h
//  FMDBDemo
//
//  Created by ChenMan on 16/5/18.
//  Copyright © 2016年 ChenManV. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject

@property(nonatomic,strong) NSNumber *ID;


@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger age;

@property(nonatomic,assign) NSInteger number;
/**
 *  一个人可以拥有多辆车
 */
@property(nonatomic,strong) NSMutableArray *carArray;



@end
