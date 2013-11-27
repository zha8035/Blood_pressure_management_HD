//
//  JSlocalSaveAndRead.h
//  JS血压ipad
//
//  Created by han's mac on 11/23/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSlocalSaveAndRead : NSObject
{
    NSMutableDictionary *familyMembers;
}
@property (nonatomic) NSDictionary *familyMembers;
- (void)saveNewFamilyMember:(NSDictionary *)infoDict
                           :(NSString *)name;
-(void)read;
- (void)saveNewData:(NSDictionary *)data
                   :(NSString *)name
                   :(NSString *)date;

- (void)deleteData:(NSString *)date
                  :(NSString *)name;

- (void)deleteMember:(NSString *)name;

@end
