//
//  YX_jieism4.c
//  TacsPushSDK
//
//  Created by shg on 2019/6/14.
//  Copyright © 2019 code. All rights reserved.
//

#include "YX_jieism4.h"
#include <string.h>
#include <stdio.h>
#include "YX_sm4.h"
int mainTest4()//mainTest4
{
    unsigned char key[16] ;//= {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
    unsigned char input[16] ;//= {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
    unsigned char output[16];
    YX_sm4_context ctx;
    unsigned long i;
    
    //encrypt standard testing vector
    YX_sm4_setkey_enc(&ctx,key);
    YX_sm4_crypt_ecb(&ctx,1,16,input,output);
    for(i=0;i<16;i++)
        printf("%02x ", output[i]);
    printf("\n");
    
    //decrypt testing
    YX_sm4_setkey_dec(&ctx,key);
    YX_sm4_crypt_ecb(&ctx,0,16,output,output);
    for(i=0;i<16;i++)
        printf("%02x ", output[i]);
    printf("\n");
    
    //decrypt 1M times testing vector based on standards.
    i = 0;
    YX_sm4_setkey_enc(&ctx,key);
    while (i<1000000)
    {
        YX_sm4_crypt_ecb(&ctx,1,16,input,input);
        i++;
    }
    for(i=0;i<16;i++)
        printf("%02x ", input[i]);
    printf("\n");
    
    return 0;
}
void testEncodejiami(unsigned long lenght,unsigned char in[], unsigned char output[]){
    
    // 1   10进制
    //043  8进制
    //0x45  16进制
    
    unsigned char key[16]   = {1,043,0105,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
    YX_sm4_context ctx;
    //设置上下文和密钥
    YX_sm4_setkey_enc(&ctx,key);
    //加密
    YX_sm4_crypt_ecb(&ctx,1,lenght,in,output);
    
}
void testDecodejiemi(unsigned long lenght, unsigned char in[], unsigned char output[],unsigned char key[16]){
//    unsigned char key[16]   = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
    YX_sm4_context ctx;
    //设置上下文和密钥
    YX_sm4_setkey_dec(&ctx,key);
    //解密
    YX_sm4_crypt_ecb(&ctx,0,lenght,in,output);
}

