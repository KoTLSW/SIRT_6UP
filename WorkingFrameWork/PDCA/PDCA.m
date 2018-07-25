//
//  PDCA.m
//  B312_BT_MIC_SPK
//
//  Created by EW on 16/5/13.
//  Copyright © 2016年 h. All rights reserved.
//

#import "PDCA.h"
//==========================================
@interface PDCA ()
{
    IP_UUTHandle     UID;
    IP_API_Reply     reply;
    time_t           time_start;
    time_t           time_end;
}
@end
//==========================================
@implementation PDCA
//==========================================
-(void)PDCA_GetStartTime
{
    time(&time_start);
}
//==========================================
-(void)PDCA_GetEndTime
{
    time(&time_end);
}
//==========================================
-(void)PDCA_Init:(NSString*)sn SW_name:(NSString*)sw_name SW_ver:(NSString*)sw_ver
{
    IP_reply_destroy(IP_UUTStart(&UID));
    IP_reply_destroy(IP_addAttribute(UID, IP_ATTRIBUTE_SERIALNUMBER, [sn UTF8String]));
    IP_reply_destroy(IP_addAttribute(UID, IP_ATTRIBUTE_STATIONSOFTWARENAME, [sw_name UTF8String]));
    IP_reply_destroy(IP_addAttribute(UID, IP_ATTRIBUTE_STATIONSOFTWAREVERSION, [sw_ver UTF8String]));
    
    IP_reply_destroy(IP_setStartTime(UID,time_start));
}
//==========================================
-(void)PDCA_AddAttribute:(NSString*)sbuild FixtureID:(NSString*)fixtureid
{
    IP_reply_destroy(IP_addAttribute(UID, IP_ATTRIBUTE_SPECIAL_BUILD , [sbuild UTF8String]));
    IP_reply_destroy(IP_addAttribute(UID, IP_ATTRIBUTE_FIXTURE_ID , [fixtureid UTF8String]));
}
//==========================================
-(void)PDCA_UploadPass:(NSString*)test_name
{
        
    IP_TestSpecHandle   testSpec   = IP_testSpec_create();
    IP_TestResultHandle testResult = IP_testResult_create();
    
    IP_testSpec_setTestName(testSpec,[test_name UTF8String], strlen([test_name UTF8String]));
    
    IP_testResult_setResult(testResult,IP_PASS);
    
    IP_reply_destroy(IP_addResult(UID, testSpec, testResult));
    
    IP_testResult_destroy(testResult);
    IP_testSpec_destroy(testSpec);
    
}
//==========================================
-(void)PDCA_UploadFail:(NSString*)test_name Message:(NSString*)message
{
        
    IP_TestSpecHandle   testSpec   = IP_testSpec_create();
    IP_TestResultHandle testResult = IP_testResult_create();
    
    IP_testSpec_setTestName(testSpec,[test_name UTF8String],strlen([test_name UTF8String]));
    
    IP_testResult_setResult(testResult, IP_FAIL);
    IP_testResult_setMessage(testResult,[message UTF8String],strlen([message UTF8String]));
    
    IP_reply_destroy(IP_addResult(UID, testSpec, testResult));
    
    IP_testResult_destroy(testResult);
    IP_testSpec_destroy(testSpec);
    
}
//==========================================
-(void)PDCA_UploadValue:(NSString*)test_name Lower:(NSString*)lower Upper:(NSString*)upper Unit:(NSString*)units Value:(NSString*)value Pass_Fail:(BOOL)pass_fail
{
        
    IP_TestSpecHandle     testSpec = IP_testSpec_create();
    IP_TestResultHandle testResult = IP_testResult_create();
    
    IP_testSpec_setTestName(testSpec, [test_name UTF8String], strlen([test_name UTF8String]));
    IP_testSpec_setLimits(testSpec, [lower UTF8String],strlen([lower UTF8String]), [upper UTF8String], strlen([upper UTF8String]));
    IP_testSpec_setUnits(testSpec, [units UTF8String], strlen([units UTF8String]));
    IP_testSpec_setPriority(testSpec, IP_PRIORITY_REALTIME);
    
    IP_testResult_setValue(testResult, [value UTF8String], strlen([value UTF8String]));
    
    if(pass_fail == NO)
    {
        IP_testResult_setResult(testResult, IP_FAIL);
    }else
    {
        IP_testResult_setResult(testResult, IP_PASS);
    }
    
    IP_reply_destroy(IP_addResult(UID, testSpec, testResult));
    
    IP_testResult_destroy(testResult);
    IP_testSpec_destroy(testSpec);
    
}
//==========================================
-(void)PDCA_Upload:(BOOL)pass_fail
{
    IP_reply_destroy(IP_UUTDone(UID));
    
    if(pass_fail == NO)
    {
        IP_reply_destroy(IP_UUTCommit(UID, IP_FAIL));
    }
    else
    {
        IP_reply_destroy(IP_UUTCommit(UID, IP_PASS));
    }
    
    IP_reply_destroy(IP_setStopTime(UID,time_end));
    
    IP_UID_destroy(UID);
    
}


//==========================================
-(BOOL) AddBlob:(NSString*) fileName FilePath:(NSString*) filePath
{
    BOOL flag = NO;
    //reply = IP_addBlob(UID, [fileName UTF8String], [filePath UTF8String]);
    
    if(IP_success(reply))
    {
        [self setErrorInfo:@""];
        flag = YES;
    }
    else
    {
        [self setErrorInfo:[NSString stringWithUTF8String:IP_reply_getError(reply)]];
        flag = NO;
    }
    
    if (reply)
    {
        IP_reply_destroy(reply);
        reply = NULL;
    }
    
    if(!flag)
    {
        [self UIDCancel];
    }
    
    return flag;
}
//==========================================

-(void) UIDCancel
{
    if(UID)
    {
        IP_UUTCancel(UID);
        UID = NULL;
    }
}
@end
