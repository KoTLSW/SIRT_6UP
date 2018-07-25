//
//  Common.h
//  HowToWorks
//
//  Created by h on 17/4/10.
//  Copyright © 2017年 bill. All rights reserved.
//
//此头文件，定义消息，用户信息。

#ifndef Common_h
#define Common_h


//消息
#define kNotificationPreferenceChange       @"PreferenceConfigChange"
#define kNotificationShowErrorTipOnUI       @"ShowErrorTipOnUI"
//Login
#define kLoginUserName                      @"Login_UserName"
#define kLoginUserPassword                  @"Login_Password"
#define kLoginUserAuthority                 @"Login_Authority"

//UpdateItem---key---subkey
#define kFixtureFix1                        @"Fix1"
#define kFixtureFix2                        @"Fix2"
#define kFixtureFix3                        @"Fix3"
#define kFixtureFix4                        @"Fix4"
#define kFixtureFix5                        @"Fix5"
#define kFixtureFix6                        @"Fix6"

#define kFixtureFix_ABC_DEF_Res             @"fix_ABC_DEF_Res"
#define kFixtureFix_B2_E2_Res               @"fix_B2_E2_Res"
#define kFixtureFix_B4_E4_Res               @"fix_B4_E4_Res"
#define kFixtureFix_B_E_Res                 @"fix_B_E_Res"
#define kFixtureFix_Cap                     @"fix_Cap"


//从ViewCtroller中传入到TestAction中各设置时间
#define kResetAirAndWaterTime               @"kResetAirAndWaterTime"

#define kResetCurrentArrange                @"kResetCurrentArrange"







//NSString *  numstring = @"ShowErrorTipOnUI";
typedef enum  __USER_AUTHORITY{
    AUTHORITY_ADMIN = 0,
    AUTHORITY_ENGINEER = 1,
    AUTHORITY_OPERATOR = 2,
}USER_AUTHORITY;

typedef struct __USER_INFOR {
    char szName[32];
    char szPassword[32];
    USER_AUTHORITY Authority;
}USER_INFOR;

enum FixType
{
    FixType_One,    //第一个治具
    FixType_Two,    //第二个治具
    FixType_Three,  //第三个治具
    FixType_Four,   //第四个治具
    FixType_Five,  //第五个治具
    FixType_Six,   //第六个治具
    FixType_Default=FixType_One,
    
};


#endif /* Common_h */
