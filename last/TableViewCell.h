//
//  TableViewCell.h
//  last
//
//  Created by ses on 15/7/1.
//  Copyright (c) 2015年 上海壹嫂网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void(^show)(CGFloat rect,UIButton *btn);
@protocol TableViewCellDelegat <NSObject>

-(void)showView:(NSNumber *)wight btn:(UIButton *)button;

@end
@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)threeBtn:(UIButton *)sender;
@property(nonatomic,strong)id<TableViewCellDelegat>delegat;
@property(nonatomic,strong)NSString *str;
//@property(nonatomic,strong)show showView;
@end
