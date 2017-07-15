//
//  DataBaseManager.m
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import "DataBaseManager.h"


@implementation DataBaseManager

//单例
+(instancetype)sharedManager{
    
    static DataBaseManager *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        manager = [[DataBaseManager alloc] init];
        
    });
    return manager;
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        NSString *docDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [docDir stringByAppendingPathComponent:@"DB2.sqlite"];
        
        NSLog(@"路径 = %@",filePath);
        
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    }
    return self;
}

@end
