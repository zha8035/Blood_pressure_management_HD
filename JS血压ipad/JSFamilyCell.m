//
//  JSFamilyCell.m
//  JS血压ipad
//
//  Created by han's mac on 11/21/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//
#define cellHight 100;
#import "JSFamilyCell.h"
#import "PNColor.h"
@implementation JSFamilyCell
{
    UIImageView *headImageView;
    UILabel *nameLab;
    UILabel *infoLab;
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        CALayer *imageBG = [[CALayer alloc] init];
        imageBG.frame = CGRectMake(40, 20, 100, 100);
        imageBG.cornerRadius = 50;
        imageBG.backgroundColor =[UIColor whiteColor].CGColor;
        imageBG.borderWidth = 2;
        imageBG.borderColor = PNGreen.CGColor;
        [self.contentView.layer addSublayer:imageBG];
        
        self.backgroundColor = [UIColor clearColor];
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        headImageView.center = CGPointMake(90, 66);
        headImageView.layer.cornerRadius = 40;
        headImageView.image = [UIImage imageNamed:@"headImage0"];
        
        [self.contentView addSubview:headImageView];
        
        
        nameLab = [[UILabel alloc] initWithFrame:CGRectMake(180, 45, 100, 50)];
        nameLab.text = @"haha";
        nameLab.font = [UIFont systemFontOfSize:30];
        nameLab.textColor = [UIColor whiteColor];
        [self.contentView addSubview:nameLab];
        
        infoLab = [[UILabel alloc] initWithFrame:CGRectMake(300, 20, 300, 100)];
        infoLab.numberOfLines = 0;
        infoLab.textColor = [UIColor whiteColor];
        infoLab.text = @"性别: 男       身高:170\n\n体重:170";
        [self.contentView addSubview:infoLab];
        
            }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
