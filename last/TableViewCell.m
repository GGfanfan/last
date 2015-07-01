//
//  TableViewCell.m
//  last
//
//  Created by ses on 15/7/1.
//  Copyright (c) 2015年 上海壹嫂网络科技有限公司. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _myLabel.text=_str;
}
- (IBAction)threeBtn:(UIButton *)sender {
    if (sender.tag==1) {
        CGFloat w=sender.frame.size.width;
        NSNumber *number=[NSNumber numberWithFloat:w];
//        if (self.showView) {
//            self.showView(w,sender);
//        }
        if ([self.delegat respondsToSelector:@selector(showView:btn:)]) {
            [self.delegat performSelector:@selector(showView:btn:)withObject:number withObject:sender];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
