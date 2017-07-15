//
//  DBQTableViewCell.m
//  FMDB_CM
//
//  Created by ChenMan on 2017/7/14.
//  Copyright © 2017年 ChenMan. All rights reserved.
//

#import "DBQTableViewCell.h"
#import "BookDTO.h"

@implementation DBQTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellMdl:(UserDTO *)cellMdl{
    
    self.NameLbl.text = cellMdl.name;
    self.AgeLbl.text = [NSString stringWithFormat:@"%ld",cellMdl.age] ;
    self.ScoreLbl.text = [NSString stringWithFormat:@"%f",cellMdl.score];
    self.BookLbl.text = cellMdl.book.bookName;
    self.DateLbl.text = [NSString stringWithFormat:@"%@",cellMdl.date];
    self.showImg.image = cellMdl.img;
}

@end
