//
//  MainViewController.h
//  FMDB_CM
//
//  Created by ChenMan on 2017/7/14.
//  Copyright © 2017年 ChenMan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMViewController.h"
#import "DBQViewController.h"

@interface MainViewController : UITabBarController

@property (nonatomic , assign) NSInteger currentTabIndex;
@property (nonatomic, strong) FMViewController *firstVC;
@property (nonatomic, strong) DBQViewController *secondVC;

@end
