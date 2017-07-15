//
//  UserDTO.m
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import "UserDTO.h"
#import "BookDTO.h"

@implementation UserDTO

///构造器1
+ (UserDTO *)userWithUserName:(NSString *)userName
                      userAge:(NSInteger)userAge
                    userScore:(float)userScore
                          arr:(NSArray *)arr
                          dic:(NSDictionary *)dic
                         book:(BookDTO *)book
                         date:(NSDate *)date
                        image:(UIImage *)img{

    UserDTO *dto = [[UserDTO alloc] init];
    dto.name = userName;
    dto.age = userAge;
    dto.score = userScore;
    dto.arr = arr;
    dto.dic = dic;
    dto.book = book;
    dto.date = date;
    dto.img = img;

    return dto;
}


@end
