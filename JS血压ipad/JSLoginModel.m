//
//  JSLoginModel.m
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSLoginModel.h"
#import "JSlocalSaveAndRead.h"
@implementation JSLoginModel
@synthesize familyMembers;
- (void)login
{
    _status = YES;
    //familyMembers = @{@"john": @{@"HBP": @"120",@"LBP": @"70",@"HR":@"60"}};
    //familyMembers = @{@"john": @{@"info": @{@"name": @"john",@"gender":@"M",@"age":@"18",@"height":@"180",@"weight":@"180"}}@{@"data":{@"HBP": @"120",@"LBP": @"70",@"HR":@"60"}}};
//    NSDictionary *info = @{@"name": @"john",@"gender":@"男",@"age":@"18",@"height":@"180",@"weight":@"180",@"image":@"headImage0"};
//    NSDictionary *data = @{@"BPH": @"120",@"BPL": @"70",@"HR":@"60"};
//    familyMembers = @{@"john": @{@"info": info,@"data":@{@"2013-1-1": data}}};
   
    JSlocalSaveAndRead *readModel = [[JSlocalSaveAndRead alloc] init];
    [readModel read];
    familyMembers = readModel.familyMembers;
    NSLog(@"%@",familyMembers);
}
@end
