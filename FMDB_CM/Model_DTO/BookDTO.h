//
//  BookDTO.h
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookDTO : NSObject

@property (nonatomic, copy) NSString *bookName;

@property (nonatomic, assign) NSInteger bookId;

/** 创建book */
+ (BookDTO *)bookWithBookName:(NSString *)bookName bookId:(NSInteger)bookId;


@end
