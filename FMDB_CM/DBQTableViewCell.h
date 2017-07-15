//
//  DBQTableViewCell.h
//  FMDB_CM
//
//  Created by ChenMan on 2017/7/14.
//  Copyright © 2017年 ChenMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDTO.h"

@interface DBQTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *NameLbl;
@property (weak, nonatomic) IBOutlet UILabel *AgeLbl;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *BookLbl;
@property (weak, nonatomic) IBOutlet UILabel *BookIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *DateLbl;
@property (weak, nonatomic) IBOutlet UIImageView *showImg;

@property (weak, nonatomic) UserDTO *cellMdl;

@end
