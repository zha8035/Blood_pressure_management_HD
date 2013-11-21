//
//  JSLoginModel.h
//  JS血压ipad
//
//  Created by han's mac on 11/18/13.
//  Copyright (c) 2013 han's mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSLoginModel : NSObject

@property (nonatomic,weak) NSString *username;
@property (nonatomic,weak) NSString *password;
@property (nonatomic,weak) NSString *infoDictionary;
@property  BOOL status;

- (void)login;
@end
