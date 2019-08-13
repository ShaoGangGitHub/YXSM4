//
//  NSString+YX_GM_String.h
//  YXSM4
//
//  Created by 邵刚 on 2018/10/26.
//  Copyright © 2018年 邵刚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YX_GM_String :NSObject

/**
 sm4加密，加密方式ecb

 @param key 16位随机串
 @return 加密后的base64字符串
 */
+ (NSString *)sm4WithKey:(NSString *)key str:(NSString *)str;

+ (NSString *)sm4DataWithKey:(NSString *)key str:(NSString *)str;

/**
 sm4解密
 
 @param sm4Str sm4字符串
 @return 解密后的字符串
 */
+ (NSString *)sm4JieMi:(NSString *)sm4Str key:(NSString *)key;

/**
 sm3加密
 
 @return sm3加密后的base64字符串
 */
+ (NSString *)sm3str:(NSString *)str;

/**
 sm3加密
 
 @return sm3加密 data String
 */
+ (NSString *)sm3ForDatastr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
