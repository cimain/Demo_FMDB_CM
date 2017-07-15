//
//  BookDTO.m
//  MLFMDB
//

//  Copyright © 2016年 Demos. All rights reserved.
//

#import "BookDTO.h"

@implementation BookDTO

+ (BookDTO *)bookWithBookName:(NSString *)bookName bookId:(NSInteger)bookId{
    
    BookDTO *dto = [[BookDTO alloc] init];
    dto.bookName = bookName;
    dto.bookId   = bookId;
    return dto;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_bookName forKey:@"bookName"];
    [coder encodeInteger:_bookId forKey:@"bookId"];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        self.bookName = [coder decodeObjectForKey:@"bookName"];
        self.bookId   = [coder decodeIntegerForKey:@"bookId"];
    }
    return self;
}



@end
