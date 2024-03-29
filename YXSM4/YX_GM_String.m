//
//  NSString+YX_GM_String.m
//  YXSM4
//
//  Created by 邵刚 on 2018/10/26.
//  Copyright © 2018年 邵刚. All rights reserved.
//

#import "YX_GM_String.h"
#import "YX_GM.h"

@implementation YX_GM_String

/**
 sm4加密
 
 @param key 16位随机值
 @return 加密后的base64字符串
 */
+ (NSString *)sm4WithKey:(NSString *)key str:(nonnull NSString *)str
{
    //    //sm4
    NSString *sm4_key = key;
//    NSLog(@"key for sm4:%@", sm4_key);
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //sm4 encrypt
    NSData *plainData = [str dataUsingEncoding:gbkEncoding];
    NSData *cipherData = [[YX_GM shared] sm4_encryptData:plainData withCipherKey:sm4_key];
    NSString *base64Cipher = [cipherData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    NSString *base64Cipher = [self convertToNSString:cipherData];
    
//    NSLog(@"加密结果:%@---%@", cipherData, base64Cipher);
    return base64Cipher;
    //    return @"";
}

+ (NSString *)sm4DataWithKey:(NSString *)key str:(nonnull NSString *)str
{
    NSString *sm4_key = key;
    //    NSLog(@"key for sm4:%@", sm4_key);
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    //sm4 encrypt
    NSData *plainData = [str dataUsingEncoding:gbkEncoding];
    NSData *cipherData = [[YX_GM shared] sm4_encryptData:plainData withCipherKey:sm4_key];
    NSString *base64Cipher = [self convertToNSString:cipherData];
    return base64Cipher;
}

+ (NSString *)desm4
{
    return @"";
}

/**
 sm3加密
 
 @return sm3加密后的base64字符串
 */
+ (NSString *)sm3str:(NSString *)str
{
    NSData *plainData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *sm3Hash = [[YX_GM shared] sm3_hashWithPainData:plainData];
    NSString *sm3HashString = [sm3Hash base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return sm3HashString;
}

+ (NSString *)sm3ForDatastr:(NSString *)str
{
    NSData *plainData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *sm3Hash = [[YX_GM shared] sm3_hashWithPainData:plainData];
    return [self convertToNSString:sm3Hash];
}

+ (NSString *)convertToNSString:(NSData *)data
{
    NSMutableString *strTemp = [NSMutableString stringWithCapacity:[data length]*2];
    const unsigned char *szBuffer = [data bytes];
    for (NSInteger i=0; i < [data length]; ++i) {
        [strTemp appendFormat:@"%02lx",(unsigned long)szBuffer[i]];
    }
    return strTemp.mutableCopy;
}

+ (NSString *)sm4JieMi:(NSString *)sm4Str key:(nonnull NSString *)key
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:sm4Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *str = [YX_GM CSM4Decryption:data key:key];
    return str;
}

@end
