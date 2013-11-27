//
//  JSBPCell.m
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSBPCell.h"


#define cellHight 140
#define SCREEN_WIDTH 400

@implementation JSBPCell
@synthesize BPH_Label,BPL_Label,HR_Label,dateLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        CALayer *leftGreenBar = [[CALayer alloc] init];
        leftGreenBar.backgroundColor = PNGreen.CGColor;
        leftGreenBar.frame = CGRectMake(0, 25, 7, 81);
        [self.layer addSublayer:leftGreenBar];
        
        CALayer *midGreenBar = [[CALayer alloc] init];
        midGreenBar.backgroundColor = PNGreen.CGColor;
        midGreenBar.frame = CGRectMake(413, 2, 6, 138);
        [self.layer addSublayer:midGreenBar];
        
        CALayer *dot1 = [[CALayer alloc] init];
        dot1.frame = CGRectMake(293, 37, 12, 12);
        dot1.cornerRadius = 7.05;
        dot1.backgroundColor = PNGreen.CGColor;
        [self.layer addSublayer:dot1];
        
        CALayer *dot2 = [[CALayer alloc] init];
        dot2.frame = CGRectMake(293, 87, 12, 12);
        dot2.cornerRadius = 7.05;
        dot2.backgroundColor = PNGreen.CGColor;
        [self.layer addSublayer:dot2];
        
        CALayer *dot3 = [[CALayer alloc] init];
        dot3.frame = CGRectMake(477, 37, 12, 12);
        dot3.cornerRadius = 7.05;
        dot3.backgroundColor = PNGreen.CGColor;
        [self.layer addSublayer:dot3];
        
        UILabel *bpTitleLabel = [[UILabel alloc] init];
        bpTitleLabel.frame = CGRectMake(20, 25, 30, 80);
        bpTitleLabel.numberOfLines = 0;
        bpTitleLabel.font = [UIFont systemFontOfSize:23];
        bpTitleLabel.textColor = [UIColor whiteColor];
        bpTitleLabel.text = @"血压";
        [self.contentView addSubview:bpTitleLabel];
        
        UILabel *hrTitleLabel = [[UILabel alloc] init];
        hrTitleLabel.frame = CGRectMake(413+15, 25, 30, 80);
        hrTitleLabel.numberOfLines = 0;
        hrTitleLabel.font = [UIFont systemFontOfSize:23];
        hrTitleLabel.textColor = [UIColor whiteColor];
        hrTitleLabel.text = @"心率";
        [self.contentView addSubview:hrTitleLabel];
        
        BPH_Label = [[UILabel alloc] initWithFrame:CGRectMake(283, 9, 53, 27)];
        BPH_Label.font = [UIFont systemFontOfSize:27];
        BPH_Label.textColor = [UIColor whiteColor];
        BPH_Label.text = @"140";
        [self.contentView addSubview:BPH_Label];
        
        BPL_Label = [[UILabel alloc] initWithFrame:CGRectMake(291, 54, 53, 33)];
        BPL_Label.font = [UIFont systemFontOfSize:27];
        BPL_Label.textColor = [UIColor whiteColor];
        BPL_Label.text = @"80";
        [self.contentView addSubview:BPL_Label];
        
        HR_Label = [[UILabel alloc] initWithFrame:CGRectMake(467, 9, 53, 27)];
        HR_Label.font = [UIFont systemFontOfSize:27];
        HR_Label.textColor = [UIColor whiteColor];
        HR_Label.text = @"60";
        [self.contentView addSubview:HR_Label];
        
        UILabel *bphTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(344, 12, 51, 21)];
        bphTitleLabel.font = [UIFont systemFontOfSize:15];
        bphTitleLabel.textColor = [UIColor whiteColor];
        bphTitleLabel.text = @"收缩压";
        [self.contentView addSubview:bphTitleLabel];
        
        UILabel *bplTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(344, 62, 51, 21)];
        bplTitleLabel.font = [UIFont systemFontOfSize:15];
        bplTitleLabel.textColor = [UIColor whiteColor];
        bplTitleLabel.text = @"舒张压";
        [self.contentView addSubview:bplTitleLabel];
        
        UILabel *hrStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(508, 12, 51, 21)];
        hrStringLabel.font = [UIFont systemFontOfSize:15];
        hrStringLabel.textColor = [UIColor whiteColor];
        hrStringLabel.text = @"BPM";
        [self.contentView addSubview:hrStringLabel];
        
//        JSChartBox *BPChart = [[JSChartBox alloc] initWithFrame:CGRectMake(50, 20, 250, 110)];
//        [BPChart buildBPbox];
//        [self.contentView addSubview:BPChart];
        
//        bloodChart = [[PNChart alloc] initWithFrame:CGRectMake(540, 0, SCREEN_WIDTH-110, cellHight)];
//        bloodChart.backgroundColor = [UIColor clearColor];
//        [bloodChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
//        [bloodChart setYValues:@[@"1",@"10",@"2",@"6",@"3"]];
//        [bloodChart strokeChart];
//        [self.contentView addSubview:bloodChart];
//        
//        highBloodChart = [[PNChart alloc] initWithFrame:CGRectMake(30, 0, SCREEN_WIDTH-120,cellHight)];
//        highBloodChart.backgroundColor = [UIColor clearColor];
//        highBloodChart.type = PNBarType;
//        highBloodChart.strokeColor = PNRed;
//        [highBloodChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
//        [highBloodChart setYValues:@[@"1",@"10",@"2",@"6",@"3"]];
//        [highBloodChart strokeChart];
//        [self.contentView addSubview:highBloodChart];
//        
//        lowBloodChart = [[PNChart alloc] initWithFrame:CGRectMake(40, 0, SCREEN_WIDTH-120, cellHight)];
//        lowBloodChart.backgroundColor = [UIColor clearColor];
//        lowBloodChart.type = PNBarType;
//        //[barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
//        [lowBloodChart setYValues:@[@"10",@"16",@"9",@"6",@"3"]];
//        [lowBloodChart strokeChart];
//        [self.contentView addSubview:lowBloodChart];


        
        
        
            }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawChart:(NSDictionary *)sender
{
    [bloodChart removeFromSuperview];
    NSArray *dates = [sender allKeys];
    NSMutableArray *BPH = [[NSMutableArray alloc] init];
    NSMutableArray *BPL = [[NSMutableArray alloc] init];
    NSMutableArray *HR  = [[NSMutableArray alloc] init];
    
    for(int i=0;i<[dates count];i++)
    {
        NSDictionary *data = [sender objectForKey:[dates objectAtIndex:i]];
        NSInteger BPH_Str = [[data objectForKey:@"BPH"]integerValue]/30;
        NSInteger BPL_Str = [[data objectForKey:@"BPL"]integerValue]/30;
        NSInteger HR_Str = [[data objectForKey:@"HR"]integerValue]/12;
        [BPH addObject:[NSString stringWithFormat:@"%i",BPH_Str]];
        [BPL addObject:[NSString stringWithFormat:@"%i",BPL_Str]];
        [HR  addObject:[NSString stringWithFormat:@"%i",HR_Str]];
    }
    bloodChart = [[PNChart alloc] initWithFrame:CGRectMake(540, 0, SCREEN_WIDTH-110, cellHight)];
    bloodChart.backgroundColor = [UIColor clearColor];
    [bloodChart setXLabels:dates];
    [bloodChart setYValues:HR];
    [bloodChart strokeChart];
    [self.contentView addSubview:bloodChart];
    
    highBloodChart = [[PNChart alloc] initWithFrame:CGRectMake(30, 0, SCREEN_WIDTH-120,cellHight)];
    highBloodChart.backgroundColor = [UIColor clearColor];
    highBloodChart.type = PNBarType;
    highBloodChart.strokeColor = PNRed;
    [highBloodChart setXLabels:dates];
    [highBloodChart setYValues:BPH];
    [highBloodChart strokeChart];
    [self.contentView addSubview:highBloodChart];
    
    lowBloodChart = [[PNChart alloc] initWithFrame:CGRectMake(40, 0, SCREEN_WIDTH-120, cellHight)];
    lowBloodChart.backgroundColor = [UIColor clearColor];
    lowBloodChart.type = PNBarType;
    //[barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    [lowBloodChart setYValues:BPL];
    [lowBloodChart strokeChart];
    [self.contentView addSubview:lowBloodChart];

}

@end
