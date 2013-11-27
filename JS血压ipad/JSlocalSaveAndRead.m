
//
//  JSlocalSaveAndRead.m
//  JS血压ipad
//
//  Created by han's mac on 11/23/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import "JSlocalSaveAndRead.h"

@implementation JSlocalSaveAndRead
{
    NSString *filename;
}
@synthesize familyMembers;
- (void)saveNewFamilyMember:(NSDictionary *)infoDict
                           :(NSString *)name
{
    [self read];
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithDictionary:familyMembers];
    NSDictionary *data = [[NSDictionary alloc] init];
    NSDictionary *info = infoDict;
    NSDictionary *adder = @{@"data": data,@"info":info};
    [rootDict setObject:adder forKey:name];
    //NSLog(@"%@",rootDict);
    [rootDict writeToFile:filename atomically:YES];
    
}

- (void)saveNewData:(NSDictionary *)data
                   :(NSString *)name
                   :(NSString *)date
{
    [self read];
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithDictionary:familyMembers];
    NSMutableDictionary *secDict  = [rootDict objectForKey:name];
    NSMutableDictionary *thirdDict = [secDict objectForKey:@"data"];
    [thirdDict setObject:data forKey:date];
    
    [secDict setValue:thirdDict forKey:@"data"];
    [rootDict setValue:secDict forKey:name];
    
    [rootDict writeToFile:filename atomically:YES];
}
- (void)deleteData:(NSString *)date
                  :(NSString *)name
{
    [self read];
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithDictionary:familyMembers];
    NSMutableDictionary *secDict = [rootDict objectForKey:name];
    NSMutableDictionary *thirdDict = [secDict objectForKey:@"data"];
    [thirdDict removeObjectForKey:date];
    [secDict setValue:thirdDict forKey:@"data"];
    [rootDict setValue:secDict forKey:name];
    [rootDict writeToFile:filename atomically:YES];
    
}

- (void)deleteMember:(NSString *)name
{
    [self read];
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc] initWithDictionary:familyMembers];
    [rootDict removeObjectForKey:name];
    [rootDict writeToFile:filename atomically:YES];
}

-(void)read
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
    filename=[plistPath1 stringByAppendingPathComponent:@"save.plist"];
    familyMembers = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    

}
@end
