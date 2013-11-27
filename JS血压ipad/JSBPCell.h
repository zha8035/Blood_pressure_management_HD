//
//  JSBPCell.h
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
@interface JSBPCell : UITableViewCell
{
    UILabel *BPH_Label;
    UILabel *BPL_Label;
    UILabel *HR_Label;
    UILabel *dateLabel;
    
    PNChart *lowBloodChart;
    PNChart *highBloodChart;
    PNChart *bloodChart;
}

@property (nonatomic,weak) NSDictionary *allInfo;
@property (nonatomic) UILabel *BPH_Label;
@property (nonatomic) UILabel *BPL_Label;
@property (nonatomic) UILabel *HR_Label;
@property (nonatomic) UILabel *dateLabel;
-(void)drawChart:(NSDictionary *)sender;
@end
