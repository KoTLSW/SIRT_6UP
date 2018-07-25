//
//  ViewController.m
//  WorkingFrameWork
//
//  Created by mac on 2017/10/27.
//  Copyright © 2017年 macjinlongpiaoxu. All rights reserved.
//

#import "ViewController.h"
#import "Table.h"
#import "Plist.h"
#import "Param.h"
#import "TestAction.h"
#import "MKTimer.h"
#import "AppDelegate.h"
#import "Folder.h"
#import "GetTimeDay.h"
#import "FileCSV.h"
#import "visa.h"
#import "SerialPort.h"
#import "Common.h"
#import "MK_FileTXT.h"
#import "MK_FileFolder.h"

//文件名称
NSString * param_Name = @"Param";

@interface ViewController()<NSTextFieldDelegate>
{
    Table * tab1;
    
    Folder   * fold;
    FileCSV  * csvFile;
    
    Plist * plist;
    Param * param;
    NSArray    *   itemArr1;
    
    TestAction * action1;
    TestAction * action2;
    TestAction * action3;
    TestAction * action4;
    TestAction * action5;
    TestAction * action6;

    
    //定时器相关
     MKTimer * mkTimer;
     int      ct_cnt;                  //记录cycle time定时器中断的次数---
    
    __weak IBOutlet NSButton *exitEditBtn;
    
    __weak IBOutlet NSTextField *W_IN1_Lable;
    __weak IBOutlet NSTextField *W_IN2_Label;
    __weak IBOutlet NSTextField *W_IN3_Label;
    __weak IBOutlet NSTextField *W_IN4_Label;
    __weak IBOutlet NSTextField *W_IN5_Label;
    __weak IBOutlet NSTextField *W_IN6_Label;
    __weak IBOutlet NSTextField *W_Out1_Label;
    __weak IBOutlet NSTextField *W_Out2_Label;
    __weak IBOutlet NSTextField *W_Out3_Label;
    __weak IBOutlet NSTextField *W_Out4_Label;
    __weak IBOutlet NSTextField *W_Out5_Label;
    __weak IBOutlet NSTextField *W_Out6_Label;
    __weak IBOutlet NSTextField *Air_In1_Label;
    __weak IBOutlet NSTextField *Air_In2_Label;
    __weak IBOutlet NSTextField *Air_In3_Label;
    __weak IBOutlet NSTextField *Air_In4_Label;
    __weak IBOutlet NSTextField *Air_In5_Label;
    __weak IBOutlet NSTextField *Air_In6_Label;
    __weak IBOutlet NSTextField *Okins1_Label;
    __weak IBOutlet NSTextField *Okins2_Label;
    __weak IBOutlet NSTextField *Okins3_Label;
    __weak IBOutlet NSTextField *Okins4_Label;
    __weak IBOutlet NSTextField *Okins5_Label;
    __weak IBOutlet NSTextField *Okins6_Label;
    __weak IBOutlet NSTextField *LH1_Label;
    __weak IBOutlet NSTextField *LH2_Label;
    __weak IBOutlet NSTextField *LH3_Label;
    __weak IBOutlet NSTextField *LH4_Label;
    __weak IBOutlet NSTextField *LH5_Label;
    __weak IBOutlet NSTextField *LH6_Label;
    __weak IBOutlet NSTextField *RTZL1_Label;
    __weak IBOutlet NSTextField *RTZL2_Label;
    __weak IBOutlet NSTextField *RTZL3_Label;
    __weak IBOutlet NSTextField *RTZL4_Label;
    __weak IBOutlet NSTextField *RTZL5_Label;
    __weak IBOutlet NSTextField *RTZL6_Label;
    __weak IBOutlet NSTextField *SUS1_Label;
    __weak IBOutlet NSTextField *SUS2_Label;
    __weak IBOutlet NSTextField *SUS3_Label;
    __weak IBOutlet NSTextField *SUS4_Label;
    __weak IBOutlet NSTextField *SUS5_Label;
    __weak IBOutlet NSTextField *SUS6_Label;
    __weak IBOutlet NSTextField *M1_Label;
    __weak IBOutlet NSTextField *M2_Label;
    __weak IBOutlet NSTextField *M3_Label;
    __weak IBOutlet NSTextField *M4_Label;
    __weak IBOutlet NSTextField *M5_Label;
    __weak IBOutlet NSTextField *M6_Label;
    
    
    __weak IBOutlet NSTextField *W_IN1_Count_TF;
    __weak IBOutlet NSTextField *W_IN2_Count_TF;
    __weak IBOutlet NSTextField *W_IN3_Count_TF;
    __weak IBOutlet NSTextField *W_IN4_Count_TF;
    __weak IBOutlet NSTextField *W_IN5_Count_TF;
    __weak IBOutlet NSTextField *W_IN6_Count_TF;
    
    __weak IBOutlet NSTextField *W_Out1_Count_TF;
    __weak IBOutlet NSTextField *W_Out2_Count_TF;
    __weak IBOutlet NSTextField *W_Out3_Count_TF;
    __weak IBOutlet NSTextField *W_Out4_Count_TF;
    __weak IBOutlet NSTextField *W_Out5_Count_TF;
    __weak IBOutlet NSTextField *W_Out6_Count_TF;
    
    
    __weak IBOutlet NSTextField *Air_In1_Count_TF;
    __weak IBOutlet NSTextField *Air_In2_Count_TF;
    __weak IBOutlet NSTextField *Air_In3_Count_TF;
    __weak IBOutlet NSTextField *Air_In4_Count_TF;
    __weak IBOutlet NSTextField *Air_In5_Count_TF;
    __weak IBOutlet NSTextField *Air_In6_Count_TF;
    
    __weak IBOutlet NSTextField *Okins1_Count_TF;
    __weak IBOutlet NSTextField *Okins2_Count_TF;
    __weak IBOutlet NSTextField *Okins3_Count_TF;
    __weak IBOutlet NSTextField *Okins4_Count_TF;
    __weak IBOutlet NSTextField *Okins5_Count_TF;
    __weak IBOutlet NSTextField *Okins6_Count_TF;
    
    
    __weak IBOutlet NSTextField *LH1_Count_TF;
    __weak IBOutlet NSTextField *LH2_Count_TF;
    __weak IBOutlet NSTextField *LH3_Count_TF;
    __weak IBOutlet NSTextField *LH4_Count_TF;
    __weak IBOutlet NSTextField *LH5_Count_TF;
    __weak IBOutlet NSTextField *LH6_Count_TF;
    
    
    __weak IBOutlet NSTextField *RZLT1_Count_TF;
    __weak IBOutlet NSTextField *RZLT2_Count_TF;
    __weak IBOutlet NSTextField *RZLT3_Count_TF;
    __weak IBOutlet NSTextField *RZLT4_Count_TF;
    __weak IBOutlet NSTextField *RZLT5_Count_TF;
    __weak IBOutlet NSTextField *RZLT6_Count_TF;
    
    
    __weak IBOutlet NSTextField *SUS1_Count_TF;
    __weak IBOutlet NSTextField *SUS2_Count_TF;
    __weak IBOutlet NSTextField *SUS3_Count_TF;
    __weak IBOutlet NSTextField *SUS4_Count_TF;
    __weak IBOutlet NSTextField *SUS5_Count_TF;
    __weak IBOutlet NSTextField *SUS6_Count_TF;
    
    __weak IBOutlet NSTextField *M1_Count_TF;
    __weak IBOutlet NSTextField *M2_Count_TF;
    __weak IBOutlet NSTextField *M3_Count_TF;
    __weak IBOutlet NSTextField *M4_Count_TF;
    __weak IBOutlet NSTextField *M5_Count_TF;
    __weak IBOutlet NSTextField *M6_Count_TF;
    
    __weak IBOutlet NSTextField *PCB1_Label;
    __weak IBOutlet NSTextField *PCB2_Label;
    __weak IBOutlet NSTextField *PCB3_Label;
    __weak IBOutlet NSTextField *PCB4_Label;
    __weak IBOutlet NSTextField *PCB5_Label;
    __weak IBOutlet NSTextField *PCB6_Label;
    
    __weak IBOutlet NSTextField *PCB1_count;
    __weak IBOutlet NSTextField *PCB2_count;
    __weak IBOutlet NSTextField *PCB3_count;
    __weak IBOutlet NSTextField *PCB4_count;
    __weak IBOutlet NSTextField *PCB5_count;
    __weak IBOutlet NSTextField *PCB6_count;
    __weak IBOutlet NSTextField *clearCount_TF;
    __weak IBOutlet NSButton *clearCount_Btn;
    
    IBOutlet NSTextField *NS_TF1;                     //产品1输入框
    IBOutlet NSTextField *NS_TF2;                     //产品2输入框
    IBOutlet NSTextField *NS_TF3;                     //产品3输入框
    IBOutlet NSTextField *NS_TF4;                     //产品4输入框
    IBOutlet NSTextField *NS_TF5;
    IBOutlet NSTextView *Log_View;                    //Log日志
    IBOutlet NSTextField *NS_TF6;
    
    IBOutlet NSTextField *  Status_TF;                //显示状态栏
    IBOutlet NSTextField *  testFieldTimes;           //时间显示输入框
    IBOutlet NSTextField *  humiture_TF;              //温湿度显示lable
    IBOutlet NSTextField *  TestCount_TF;             //测试的次数
    IBOutlet NSButton    *  IsUploadPDCA_Button;      //上传PDCA的按钮
    IBOutlet NSButton    *  IsUploadSFC_Button;       //上传SFC的按钮
    IBOutlet NSPopUpButton *product_Type;             //产品的类型
    IBOutlet NSTextField *  Version_TF;               //软件版本
    IBOutlet NSTextField *one_air_TF;
    IBOutlet NSTextField *two_air_TF;
    IBOutlet NSTextField *water_in_TF;
    IBOutlet NSButton *makesure_button;
    
    
    __weak IBOutlet NSButton *isAutoRange;
    __weak IBOutlet NSButton *singleTest;
    __weak IBOutlet NSButton *singleTest_1;
    __weak IBOutlet NSButton *singleTest_2;
    __weak IBOutlet NSButton *singleTest_3;
    __weak IBOutlet NSButton *singleTest_4;
    __weak IBOutlet NSButton *singleTest_5;
    __weak IBOutlet NSButton *singleTest_6;
    
    IBOutlet NSTextView *A_LOG_TF;
    IBOutlet NSTextView *B_LOG_TF;
    IBOutlet NSTextView *C_LOG_TF;
    IBOutlet NSTextView *D_LOG_TF;
    IBOutlet NSTextView *E_LOG_TF;
    IBOutlet NSTextView *F_LOG_TF;
    IBOutlet NSButton      *startbutton;
    
    __weak IBOutlet NSButton *resetBtn;
    //定义对应的布尔变量 判断index=101-104是否均执行
    BOOL isFix_A_Done;
    BOOL isFix_B_Done;
    BOOL isFix_C_Done;
    BOOL isFix_D_Done;
    BOOL isFix_E_Done;
    BOOL isFix_F_Done;

    BOOL isFinish;
    
    NSString * noticeStr_A;
    NSString * noticeStr_B;
    NSString * noticeStr_C;
    NSString * noticeStr_D;
    NSString * noticeStr_E;
    NSString * noticeStr_F;
    
    
    int index;
    //创建相关的属性
    NSString * foldDir;
    AppDelegate  * app;
    
    
    //测试结束通知中返回的对象===数据中含有P代表成功，含有F代表失败
    NSString             * notiString;
    NSMutableString      * notiAppendingString;//拼接的字符串
    
    //产品通过的的次数和测试的总数
    int                   passNum;     //通过的测试次数
    int                   totalNum;    //通过的测试总数
    int                   fix_A_num;
    int                   fix_B_num;
    int                   fix_C_num;
    int                   fix_D_num;
    int                   fix_E_num;
    int                   fix_F_num;


   
    //增加无限循环限制设定
    NSString *sw_org;
    NSString *foldDir_tmp;
    
    NSString *day_T;
    NSInteger controlLog;
    
    
    SerialPort  * serialport;
    NSString * fixture_uart_port_name;
    NSString * fixture_uart_port_name_e;
    NSString * fixture_uart_port_name_act;

    SerialPort  * serialportA;
    BOOL isWaterBegined;
    NSThread *MonitorThread;
    NSString *backString_ABoard;
    
    //for probes used times
   

    NSInteger pcb1_count;
    NSInteger pcb2_count;
    NSInteger pcb3_count;
    NSInteger pcb4_count;
    NSInteger pcb5_count;
    NSInteger pcb6_count;
    
    NSInteger W_In1_Count;
    NSInteger W_In2_Count;
    NSInteger W_In3_Count;
    NSInteger W_In4_Count;
    NSInteger W_In5_Count;
    NSInteger W_In6_Count;

    NSInteger W_Out1_Count;
    NSInteger W_Out2_Count;
    NSInteger W_Out3_Count;
    NSInteger W_Out4_Count;
    NSInteger W_Out5_Count;
    NSInteger W_Out6_Count;
    
    NSInteger Air_In1_Count;
    NSInteger Air_In2_Count;
    NSInteger Air_In3_Count;
    NSInteger Air_In4_Count;
    NSInteger Air_In5_Count;
    NSInteger Air_In6_Count;
    
    NSInteger Okins1_Count;
    NSInteger Okins2_Count;
    NSInteger Okins3_Count;
    NSInteger Okins4_Count;
    NSInteger Okins5_Count;
    NSInteger Okins6_Count;

    NSInteger LH1_Count;
    NSInteger LH2_Count;
    NSInteger LH3_Count;
    NSInteger LH4_Count;
    NSInteger LH5_Count;
    NSInteger LH6_Count;

    NSInteger RZLT1_Count;
    NSInteger RZLT2_Count;
    NSInteger RZLT3_Count;
    NSInteger RZLT4_Count;
    NSInteger RZLT5_Count;
    NSInteger RZLT6_Count;

    NSInteger SUS1_Count;
    NSInteger SUS2_Count;
    NSInteger SUS3_Count;
    NSInteger SUS4_Count;
    NSInteger SUS5_Count;
    NSInteger SUS6_Count;

    NSInteger M1_Count;
    NSInteger M2_Count;
    NSInteger M3_Count;
    NSInteger M4_Count;
    NSInteger M5_Count;
    NSInteger M6_Count;


}

@end

@implementation ViewController


//软件测试整个流程  //door close--->SN---->config-->监测start--->下压气缸---->抛出SN-->直接运行


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initCountTimes];
    day_T=[[GetTimeDay shareInstance] getCurrentDay];
    
    backString_ABoard=[[NSString alloc]init];
    isWaterBegined=NO;
    controlLog=0;
    isFix_A_Done=NO;
    isFix_B_Done=NO;
    isFix_C_Done=NO;
    isFix_D_Done=NO;
    isFix_E_Done=NO;
    isFix_F_Done=NO;
    isFinish=NO;
    
    noticeStr_A=[[NSString alloc]init];
    noticeStr_B=[[NSString alloc]init];
    noticeStr_C=[[NSString alloc]init];
    noticeStr_D=[[NSString alloc]init];
    noticeStr_E=[[NSString alloc]init];
    noticeStr_F=[[NSString alloc]init];
    
    NS_TF1.stringValue=@"1111";
    NS_TF2.stringValue=@"2222";
    NS_TF3.stringValue=@"3333";
    NS_TF4.stringValue=@"4444";
    NS_TF5.stringValue=@"5555";
    NS_TF6.stringValue=@"6666";
    
    //整型变量定义区
    index    = 0;
    passNum  = 0;
    totalNum = 0;
    
    fix_A_num = 0;
    fix_B_num = 0;
    fix_C_num = 0;
    fix_D_num = 0;
    fix_E_num = 0;
    fix_F_num = 0;

    
    serialportA  =  [[SerialPort alloc]init];
    plist = [Plist shareInstance];
    param = [[Param alloc]init];
    [param ParamRead:param_Name];
    
    [Version_TF setStringValue:param.sw_ver];
    sw_org=param.sw_ver;
    
    foldDir_tmp=param.foldDir;
    //第一响应
    [NS_TF1 acceptsFirstResponder];
    
    //加载界面
    itemArr1 = [plist PlistRead:@"Crown_Station" Key:@"AllItems"];
    tab1 = [[Table  alloc]init:Tab1_View DisplayData:itemArr1];
    
    
     notiAppendingString = [[NSMutableString alloc]initWithCapacity:10];
    
    
    
    //开启定时器
    mkTimer = [[MKTimer alloc]init];
    //获取测试Fail的全局变量
    app = [NSApplication sharedApplication].delegate;
    
    MonitorThread=[[NSThread alloc]initWithTarget:self selector:@selector(MonitorThread) object:nil];
    //创建总文件
    fold    = [[Folder alloc]init];
    csvFile = [[FileCSV alloc]init];
    
    
    //监听测试结束，重新等待SN
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectSnChangeNoti:) name:@"SNChangeNotice" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DisConnectFixture_A_Noti:) name:@"DisConnectFixture_A_Notification" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReConnectFixture_A_Noti:) name:@"ReConnectFixture_A_Notification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WaterOffFinished_Noti:) name:@"waterOffFinished" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WaterBegin_Noti:) name:@"waterBegin" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoginWindow:) name:@"TestUnLimit_Notification" object:nil];

    
    //将参数传入TestAction中，开启线程
    [self reloadPlist];
    
    //开启线程，扫描SN，和 获取温湿度消息
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^(void){
        
         [self Working];
        
    });

    [MonitorThread start];
    
    // Do any additional setup after loading the view.
}

-(void)LoginWindow:(NSNotification *)noti
{
    clearCount_TF.hidden=NO;
    clearCount_Btn.hidden=NO;
    exitEditBtn.hidden=NO;
}

-(void)initCountTimes
{
    NSString *strRead=[[MK_FileTXT shareInstance] TXT_ReadFromPath:@"/vault/EW_Count_Log/EW_Count_Log.txt"];
    
    if (strRead.length > 52)
    {
        NSLog(@"log 文件存在");
        NSArray *dataArr=[strRead componentsSeparatedByString:@"\n"];
        
        NSArray *pcbArr=[dataArr[0] componentsSeparatedByString:@","];
        NSArray *winArr=[dataArr[1] componentsSeparatedByString:@","];
        NSArray *woutArr=[dataArr[2] componentsSeparatedByString:@","];
        NSArray *airInArr=[dataArr[3] componentsSeparatedByString:@","];
        NSArray *okinsArr=[dataArr[4] componentsSeparatedByString:@","];
        NSArray *LHArr=[dataArr[5] componentsSeparatedByString:@","];
        NSArray *RZLTArr=[dataArr[6] componentsSeparatedByString:@","];
        NSArray *SUSArr=[dataArr[7] componentsSeparatedByString:@","];
        NSArray *MArr=[dataArr[8] componentsSeparatedByString:@","];
        
        
        pcb1_count=[pcbArr[0] integerValue];
        pcb2_count=[pcbArr[1] integerValue];
        pcb3_count=[pcbArr[2] integerValue];
        pcb4_count=[pcbArr[3] integerValue];
        pcb5_count=[pcbArr[4] integerValue];
        pcb6_count=[pcbArr[5] integerValue];
        
        W_In1_Count=[winArr[0] integerValue];
        W_In2_Count=[winArr[1] integerValue];
        W_In3_Count=[winArr[2] integerValue];
        W_In4_Count=[winArr[3] integerValue];
        W_In5_Count=[winArr[4] integerValue];
        W_In6_Count=[winArr[5] integerValue];
        
        W_Out1_Count=[woutArr[0] integerValue];
        W_Out2_Count=[woutArr[1] integerValue];
        W_Out3_Count=[woutArr[2] integerValue];
        W_Out4_Count=[woutArr[3] integerValue];
        W_Out5_Count=[woutArr[4] integerValue];
        W_Out6_Count=[woutArr[5] integerValue];
        
        Air_In1_Count=[airInArr[0] integerValue];
        Air_In2_Count=[airInArr[1] integerValue];
        Air_In3_Count=[airInArr[2] integerValue];
        Air_In4_Count=[airInArr[3] integerValue];
        Air_In5_Count=[airInArr[4] integerValue];
        Air_In6_Count=[airInArr[5] integerValue];
        
        Okins1_Count=[okinsArr[0] integerValue];
        Okins2_Count=[okinsArr[1] integerValue];
        Okins3_Count=[okinsArr[2] integerValue];
        Okins4_Count=[okinsArr[3] integerValue];
        Okins5_Count=[okinsArr[4] integerValue];
        Okins6_Count=[okinsArr[5] integerValue];
        
        LH1_Count=[LHArr[0] integerValue];
        LH2_Count=[LHArr[1] integerValue];
        LH3_Count=[LHArr[2] integerValue];
        LH4_Count=[LHArr[3] integerValue];
        LH5_Count=[LHArr[4] integerValue];
        LH6_Count=[LHArr[5] integerValue];
        
        RZLT1_Count=[RZLTArr[0] integerValue];
        RZLT2_Count=[RZLTArr[1] integerValue];
        RZLT3_Count=[RZLTArr[2] integerValue];
        RZLT4_Count=[RZLTArr[3] integerValue];
        RZLT5_Count=[RZLTArr[4] integerValue];
        RZLT6_Count=[RZLTArr[5] integerValue];
        
        SUS1_Count=[SUSArr[0] integerValue];
        SUS2_Count=[SUSArr[1] integerValue];
        SUS3_Count=[SUSArr[2] integerValue];
        SUS4_Count=[SUSArr[3] integerValue];
        SUS5_Count=[SUSArr[4] integerValue];
        SUS6_Count=[SUSArr[5] integerValue];
        
        M1_Count=[MArr[0] integerValue];
        M2_Count=[MArr[1] integerValue];
        M3_Count=[MArr[2] integerValue];
        M4_Count=[MArr[3] integerValue];
        M5_Count=[MArr[4] integerValue];
        M6_Count=[MArr[5] integerValue];
        
    }
    else
    {
        NSLog(@"log 文件不存在");
        pcb1_count=0;
        pcb2_count=0;
        pcb3_count=0;
        pcb4_count=0;
        pcb5_count=0;
        pcb6_count=0;
        
        W_In1_Count=0;
        W_In2_Count=0;
        W_In3_Count=0;
        W_In4_Count=0;
        W_In5_Count=0;
        W_In6_Count=0;
        
        W_Out1_Count=0;
        W_Out2_Count=0;
        W_Out3_Count=0;
        W_Out4_Count=0;
        W_Out5_Count=0;
        W_Out6_Count=0;
        
        Air_In1_Count=0;
        Air_In2_Count=0;
        Air_In3_Count=0;
        Air_In4_Count=0;
        Air_In5_Count=0;
        Air_In6_Count=0;
        
        Okins1_Count=0;
        Okins2_Count=0;
        Okins3_Count=0;
        Okins4_Count=0;
        Okins5_Count=0;
        Okins6_Count=0;
        
        LH1_Count=0;
        LH2_Count=0;
        LH3_Count=0;
        LH4_Count=0;
        LH5_Count=0;
        LH6_Count=0;
        
        RZLT1_Count=0;
        RZLT2_Count=0;
        RZLT3_Count=0;
        RZLT4_Count=0;
        RZLT5_Count=0;
        RZLT6_Count=0;
        
        SUS1_Count=0;
        SUS2_Count=0;
        SUS3_Count=0;
        SUS4_Count=0;
        SUS5_Count=0;
        SUS6_Count=0;
        
        M1_Count=0;
        M2_Count=0;
        M3_Count=0;
        M4_Count=0;
        M5_Count=0;
        M6_Count=0;
    }
    [self showCountTimes];
    

}



-(void)reloadPlist
{
    action1 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix1 withFileDir:foldDir withType:1];
    action1.resultTF = DUT_Result1_TF;//显示结果的lable
    action1.Log_View  = A_LOG_TF;
    action1.dutTF    = NS_TF1;
    action1.isCancel=NO;
    [action1 setFoldDir:foldDir];
    [action1 setCsvTitle:plist.titile];
    [action1 setSw_ver:param.sw_ver];
    [action1 setSw_name:param.sw_name];
    
    action2 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix2 withFileDir:foldDir withType:2];
    action2.resultTF = DUT_Result2_TF;//显示结果的lable
    action2.Log_View = B_LOG_TF;
    action2.dutTF    = NS_TF2;
    action2.isCancel=NO;
    [action2 setFoldDir:foldDir];
    [action2 setCsvTitle:plist.titile];
    [action2 setSw_ver:param.sw_ver];
    [action2 setSw_name:param.sw_name];
    
    
    action3 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix3 withFileDir:foldDir withType:3];
    action3.resultTF = DUT_Result3_TF;//显示结果的lable
    action3.Log_View = C_LOG_TF;
    action3.dutTF    = NS_TF3;
    action3.isCancel=NO;
    [action3 setFoldDir:foldDir];
    [action3 setCsvTitle:plist.titile];
    [action3 setSw_ver:param.sw_ver];
    [action3 setSw_name:param.sw_name];
    
    action4 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix4 withFileDir:foldDir withType:4];
    action4.resultTF = DUT_Result4_TF;//显示结果的lable
    action4.Log_View = D_LOG_TF;
    action4.dutTF    = NS_TF4;
    action4.isCancel=NO;
    [action4 setFoldDir:foldDir];
    [action4 setCsvTitle:plist.titile];
    [action4 setSw_ver:param.sw_ver];
    [action4 setSw_name:param.sw_name];
    
    action5 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix5 withFileDir:foldDir withType:5];
    action5.resultTF = DUT_Result5_TF;//显示结果的lable
    action5.Log_View = E_LOG_TF;
    action5.dutTF    = NS_TF5;
    action5.isCancel=NO;
    [action5 setFoldDir:foldDir];
    [action5 setCsvTitle:plist.titile];
    [action5 setSw_ver:param.sw_ver];
    [action5 setSw_name:param.sw_name];

    action6 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix6 withFileDir:foldDir withType:6];
    action6.resultTF = DUT_Result6_TF;//显示结果的lable
    action6.Log_View = F_LOG_TF;
    action6.dutTF    = NS_TF6;
    action6.isCancel=NO;
    [action6 setFoldDir:foldDir];
    [action6 setCsvTitle:plist.titile];
    [action6 setSw_ver:param.sw_ver];
    [action6 setSw_name:param.sw_name];


}


-(void)reloadPlistWithSingleTestState
{
    if (singleTest_1.state)
    {
        action1 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix1 withFileDir:foldDir withType:1];
        action1.resultTF = DUT_Result1_TF;//显示结果的lable
        action1.Log_View  = A_LOG_TF;
        action1.dutTF    = NS_TF1;
        action1.isCancel=NO;
        [action1 setFoldDir:foldDir];
        [action1 setCsvTitle:plist.titile];
        [action1 setSw_ver:param.sw_ver];
        [action1 setSw_name:param.sw_name];
        action1.dut_sn=[NS_TF1 stringValue];
        action1.isAuto=isAutoRange.state;
    }
    
    if (singleTest_2.state)
    {
        action2 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix2 withFileDir:foldDir withType:2];
        action2.resultTF = DUT_Result2_TF;//显示结果的lable
        action2.Log_View = B_LOG_TF;
        action2.dutTF    = NS_TF2;
        action2.isCancel=NO;
        [action2 setFoldDir:foldDir];
        [action2 setCsvTitle:plist.titile];
        [action2 setSw_ver:param.sw_ver];
        [action2 setSw_name:param.sw_name];
        action2.dut_sn=[NS_TF2 stringValue];
        action2.isAuto=isAutoRange.state;
    }
    
    
    if (singleTest_3.state)
    {
        action3 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix3 withFileDir:foldDir withType:3];
        action3.resultTF = DUT_Result3_TF;//显示结果的lable
        action3.Log_View = C_LOG_TF;
        action3.dutTF    = NS_TF3;
        action3.isCancel=NO;
        [action3 setFoldDir:foldDir];
        [action3 setCsvTitle:plist.titile];
        [action3 setSw_ver:param.sw_ver];
        [action3 setSw_name:param.sw_name];
        action3.dut_sn=[NS_TF3 stringValue];
        action3.isAuto=isAutoRange.state;
    }
    
    if (singleTest_4.state)
    {
        action4 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix4 withFileDir:foldDir withType:4];
        action4.resultTF = DUT_Result4_TF;//显示结果的lable
        action4.Log_View = D_LOG_TF;
        action4.dutTF    = NS_TF4;
        action4.isCancel=NO;
        [action4 setFoldDir:foldDir];
        [action4 setCsvTitle:plist.titile];
        [action4 setSw_ver:param.sw_ver];
        [action4 setSw_name:param.sw_name];
        action4.dut_sn=[NS_TF4 stringValue];
        action4.isAuto=isAutoRange.state;
    }
    
    if (singleTest_5.state)
    {
        action5 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix5 withFileDir:foldDir withType:5];
        action5.resultTF = DUT_Result5_TF;//显示结果的lable
        action5.Log_View = E_LOG_TF;
        action5.dutTF    = NS_TF5;
        action5.isCancel=NO;
        [action5 setFoldDir:foldDir];
        [action5 setCsvTitle:plist.titile];
        [action5 setSw_ver:param.sw_ver];
        [action5 setSw_name:param.sw_name];
        action5.dut_sn=[NS_TF5 stringValue];
        action5.isAuto=isAutoRange.state;

    }
    
    if (singleTest_6.state)
    {
        action6 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix6 withFileDir:foldDir withType:6];
        action6.resultTF = DUT_Result6_TF;//显示结果的lable
        action6.Log_View = F_LOG_TF;
        action6.dutTF    = NS_TF6;
        action6.isCancel=NO;
        [action6 setFoldDir:foldDir];
        [action6 setCsvTitle:plist.titile];
        [action6 setSw_ver:param.sw_ver];
        [action6 setSw_name:param.sw_name];
        action6.dut_sn=[NS_TF6 stringValue];
        action6.isAuto=isAutoRange.state;

    }
    
    
}


- (IBAction)exitEditBtn:(NSButton *)sender
{
    sender.hidden=YES;
    clearCount_TF.hidden=YES;
    clearCount_Btn.hidden=YES;
}


- (IBAction)clearCount_Btn:(NSButton *)sender
{
    
   //PCBA
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA1"])
    {
        PCB1_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA1" AndCount:pcb1_count];
        pcb1_count=0;
        PCB1_Label.backgroundColor=[NSColor greenColor];
        PCB1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA2"])
    {
        PCB2_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA2" AndCount:pcb2_count];
        pcb2_count=0;
        PCB2_Label.backgroundColor=[NSColor greenColor];
        PCB2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA3"])
    {
        PCB3_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA3" AndCount:pcb3_count];
        pcb3_count=0;
        PCB3_Label.backgroundColor=[NSColor greenColor];
        PCB3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA4"])
    {
        PCB4_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA4" AndCount:pcb4_count];
        pcb4_count=0;
        PCB4_Label.backgroundColor=[NSColor greenColor];
        PCB4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA5"])
    {
        PCB5_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA5" AndCount:pcb5_count];
        pcb5_count=0;
        PCB5_Label.backgroundColor=[NSColor greenColor];
        PCB5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"PCBA6"])
    {
        PCB6_count.stringValue=@"0";
        [self saveMaintainLogWithString:@"PCBA6" AndCount:pcb6_count];
        pcb6_count=0;
        PCB6_Label.backgroundColor=[NSColor greenColor];
        PCB6_Label.textColor=[NSColor whiteColor];
    }
    
    
    //进气阀-进水
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN1"])
    {
        W_IN1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN1" AndCount:W_In1_Count];
        W_In1_Count=0;
        W_IN1_Lable.backgroundColor=[NSColor greenColor];
        W_IN1_Lable.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN2"])
    {
        W_IN2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN2" AndCount:W_In2_Count];
        W_In2_Count=0;
        W_IN2_Label.backgroundColor=[NSColor greenColor];
        W_IN2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN3"])
    {
        W_IN3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN3" AndCount:W_In3_Count];
        W_In3_Count=0;
        W_IN3_Label.backgroundColor=[NSColor greenColor];
        W_IN3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN4"])
    {
        W_IN4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN4" AndCount:W_In4_Count];
        W_In4_Count=0;
        W_IN4_Label.backgroundColor=[NSColor greenColor];
        W_IN4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN5"])
    {
        W_IN5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN5" AndCount:W_In5_Count];
        W_In5_Count=0;
        W_IN5_Label.backgroundColor=[NSColor greenColor];
        W_IN5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_IN6"])
    {
        W_IN6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_IN6" AndCount:W_In6_Count];
        W_In6_Count=0;
        W_IN6_Label.backgroundColor=[NSColor greenColor];
        W_IN6_Label.textColor=[NSColor whiteColor];
    }

    
    //进气阀-排水
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT1"])
    {
        W_Out1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out1" AndCount:W_Out1_Count];
        W_Out1_Count=0;
        W_Out1_Label.backgroundColor=[NSColor greenColor];
        W_Out1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT2"])
    {
        W_Out2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out2" AndCount:W_Out2_Count];
        W_Out2_Count=0;
        W_Out2_Label.backgroundColor=[NSColor greenColor];
        W_Out2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT3"])
    {
        W_Out3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out3" AndCount:W_Out3_Count];
        W_Out3_Count=0;
        W_Out3_Label.backgroundColor=[NSColor greenColor];
        W_Out3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT4"])
    {
        W_Out4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out4" AndCount:W_Out4_Count];
        W_Out4_Count=0;
        W_Out4_Label.backgroundColor=[NSColor greenColor];
        W_Out4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT5"])
    {
        W_Out5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out5" AndCount:W_Out5_Count];
        W_Out5_Count=0;
        W_Out5_Label.backgroundColor=[NSColor greenColor];
        W_Out5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"W_OUT6"])
    {
        W_Out6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"W_Out6" AndCount:W_Out6_Count];
        W_Out6_Count=0;
        W_Out6_Label.backgroundColor=[NSColor greenColor];
        W_Out6_Label.textColor=[NSColor whiteColor];
    }
    
    
    //进气阀-进气
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN1"])
    {
        Air_In1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In1" AndCount:Air_In1_Count];
        Air_In1_Count=0;
        Air_In1_Label.backgroundColor=[NSColor greenColor];
        Air_In1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN2"])
    {
        Air_In2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In2" AndCount:Air_In2_Count];
        Air_In2_Count=0;
        Air_In2_Label.backgroundColor=[NSColor greenColor];
        Air_In2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN3"])
    {
        Air_In3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In3" AndCount:Air_In3_Count];
        Air_In3_Count=0;
        Air_In3_Label.backgroundColor=[NSColor greenColor];
        Air_In3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN4"])
    {
        Air_In4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In4" AndCount:Air_In4_Count];
        Air_In4_Count=0;
        Air_In4_Label.backgroundColor=[NSColor greenColor];
        Air_In4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN5"])
    {
        Air_In5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In5" AndCount:Air_In5_Count];
        Air_In5_Count=0;
        Air_In5_Label.backgroundColor=[NSColor greenColor];
        Air_In5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"AIR_IN6"])
    {
        Air_In6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Air_In6" AndCount:Air_In6_Count];
        Air_In6_Count=0;
        Air_In6_Label.backgroundColor=[NSColor greenColor];
        Air_In6_Label.textColor=[NSColor whiteColor];
    }

    
    //Okins
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS1"])
    {
        Okins1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins1" AndCount:Okins1_Count];
        Okins1_Count=0;
        Okins1_Label.backgroundColor=[NSColor greenColor];
        Okins1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS2"])
    {
        Okins2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins2" AndCount:Okins2_Count];
        Okins2_Count=0;
        Okins2_Label.backgroundColor=[NSColor greenColor];
        Okins2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS3"])
    {
        Okins3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins3" AndCount:Okins3_Count];
        Okins3_Count=0;
        Okins3_Label.backgroundColor=[NSColor greenColor];
        Okins3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS4"])
    {
        Okins4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins4" AndCount:Okins4_Count];
        Okins4_Count=0;
        Okins4_Label.backgroundColor=[NSColor greenColor];
        Okins4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS5"])
    {
        Okins5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins5" AndCount:Okins5_Count];
        Okins5_Count=0;
        Okins5_Label.backgroundColor=[NSColor greenColor];
        Okins5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"OKINS6"])
    {
        Okins6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"Okins6" AndCount:Okins6_Count];
        Okins6_Count=0;
        Okins6_Label.backgroundColor=[NSColor greenColor];
        Okins6_Label.textColor=[NSColor whiteColor];
    }

    
    //LH
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH1"])
    {
        LH1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH1" AndCount:LH1_Count];
        LH1_Count=0;
        LH1_Label.backgroundColor=[NSColor greenColor];
        LH1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH2"])
    {
        LH2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH2" AndCount:LH2_Count];
        LH2_Count=0;
        LH2_Label.backgroundColor=[NSColor greenColor];
        LH2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH3"])
    {
        LH3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH3" AndCount:LH3_Count];
        LH3_Count=0;
        LH3_Label.backgroundColor=[NSColor greenColor];
        LH3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH4"])
    {
        LH4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH4" AndCount:LH4_Count];
        LH4_Count=0;
        LH4_Label.backgroundColor=[NSColor greenColor];
        LH4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH5"])
    {
        LH5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH5" AndCount:LH5_Count];
        LH5_Count=0;
        LH5_Label.backgroundColor=[NSColor greenColor];
        LH5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"LH6"])
    {
        LH6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"LH6" AndCount:LH6_Count];
        LH6_Count=0;
        LH6_Label.backgroundColor=[NSColor greenColor];
        LH6_Label.textColor=[NSColor whiteColor];
    }

    
    //蠕动管
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT1"])
    {
        RZLT1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT1" AndCount:RZLT1_Count];
        RZLT1_Count=0;
        RTZL1_Label.backgroundColor=[NSColor greenColor];
        RTZL1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT2"])
    {
        RZLT2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT2" AndCount:RZLT2_Count];
        RZLT2_Count=0;
        RTZL2_Label.backgroundColor=[NSColor greenColor];
        RTZL2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT3"])
    {
        RZLT3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT3" AndCount:RZLT3_Count];
        RZLT3_Count=0;
        RTZL3_Label.backgroundColor=[NSColor greenColor];
        RTZL3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT4"])
    {
        RZLT4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT4" AndCount:RZLT4_Count];
        RZLT4_Count=0;
        RTZL4_Label.backgroundColor=[NSColor greenColor];
        RTZL4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT5"])
    {
        RZLT5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT5" AndCount:RZLT5_Count];
        RZLT5_Count=0;
        RTZL5_Label.backgroundColor=[NSColor greenColor];
        RTZL5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"RZLT6"])
    {
        RZLT6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"RZLT6" AndCount:RZLT6_Count];
        RZLT6_Count=0;
        RTZL6_Label.backgroundColor=[NSColor greenColor];
        RTZL6_Label.textColor=[NSColor whiteColor];
    }

    
    //SUS
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS1"])
    {
        SUS1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS1" AndCount:SUS1_Count];
        SUS1_Count=0;
        SUS1_Label.backgroundColor=[NSColor greenColor];
        SUS1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS2"])
    {
        SUS2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS2" AndCount:SUS2_Count];
        SUS2_Count=0;
        SUS2_Label.backgroundColor=[NSColor greenColor];
        SUS2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS3"])
    {
        SUS3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS3" AndCount:SUS3_Count];
        SUS3_Count=0;
        SUS3_Label.backgroundColor=[NSColor greenColor];
        SUS3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS4"])
    {
        SUS4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS4" AndCount:SUS4_Count];
        SUS4_Count=0;
        SUS4_Label.backgroundColor=[NSColor greenColor];
        SUS4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS5"])
    {
        SUS5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS5" AndCount:SUS5_Count];
        SUS5_Count=0;
        SUS5_Label.backgroundColor=[NSColor greenColor];
        SUS5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"SUS6"])
    {
        SUS6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"SUS6" AndCount:SUS6_Count];
        SUS6_Count=0;
        SUS6_Label.backgroundColor=[NSColor greenColor];
        SUS6_Label.textColor=[NSColor whiteColor];
    }

    
    //进水模组
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M1"])
    {
        M1_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M1" AndCount:M1_Count];
        M1_Count=0;
        M1_Label.backgroundColor=[NSColor greenColor];
        M1_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M2"])
    {
        M2_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M2" AndCount:M2_Count];
        M2_Count=0;
        M2_Label.backgroundColor=[NSColor greenColor];
        M2_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M3"])
    {
        M3_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M3" AndCount:M3_Count];
        M3_Count=0;
        M3_Label.backgroundColor=[NSColor greenColor];
        M3_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M4"])
    {
        M4_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M4" AndCount:M4_Count];
        M4_Count=0;
        M4_Label.backgroundColor=[NSColor greenColor];
        M4_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M5"])
    {
        M5_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M5" AndCount:M5_Count];
        M5_Count=0;
        M5_Label.backgroundColor=[NSColor greenColor];
        M5_Label.textColor=[NSColor whiteColor];
    }
    if ([[clearCount_TF.stringValue uppercaseString] containsString:@"M6"])
    {
        M6_Count_TF.stringValue=@"0";
        [self saveMaintainLogWithString:@"M6" AndCount:M6_Count];
        M6_Count=0;
        M6_Label.backgroundColor=[NSColor greenColor];
        M6_Label.textColor=[NSColor whiteColor];
    }
    
    [self saveCountLogWithString];
    clearCount_TF.stringValue=@"";
}


- (IBAction)start_Action:(id)sender //发送通知开始测试
{
    
    startbutton.enabled = NO;
    
}


- (IBAction)singleTest:(NSButton *)sender
{
    NSLog(@"sender.state==%ld",(long)sender.state);

    if (sender.state)
    {
        singleTest_1.enabled=YES;
        singleTest_2.enabled=YES;
        singleTest_3.enabled=YES;
        singleTest_4.enabled=YES;
        singleTest_5.enabled=YES;
        singleTest_6.enabled=YES;
    }
    else
    {
        singleTest_1.enabled=NO;
        singleTest_2.enabled=NO;
        singleTest_3.enabled=NO;
        singleTest_4.enabled=NO;
        singleTest_5.enabled=NO;
        singleTest_6.enabled=NO;
    }
}

- (IBAction)singleTest_1:(NSButton *)sender
{
    if (sender.state == 0)
    {
        action1.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];
        
    }
    else
    {
        //将参数传入TestAction中，开启线程
        action1 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix1 withFileDir:foldDir withType:1];
        action1.resultTF = DUT_Result1_TF;//显示结果的lable
        action1.Log_View  = A_LOG_TF;
        action1.dutTF    = NS_TF1;
        action1.isCancel=NO;
        [action1 setFoldDir:foldDir];
        [action1 setCsvTitle:plist.titile];
        [action1 setSw_ver:param.sw_ver];
        [action1 setSw_name:param.sw_name];
        action1.dut_sn = [NS_TF1 stringValue];

    }

}
- (IBAction)singleTest_2:(NSButton *)sender
{

    if (!sender.state)
    {
        action2.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];

    }
    else
    {
        action2 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix2 withFileDir:foldDir withType:2];
        action2.resultTF = DUT_Result2_TF;//显示结果的lable
        action2.Log_View = B_LOG_TF;
        action2.dutTF    = NS_TF2;
        action2.isCancel=NO;
        [action2 setFoldDir:foldDir];
        [action2 setCsvTitle:plist.titile];
        [action2 setSw_ver:param.sw_ver];
        [action2 setSw_name:param.sw_name];
        action2.dut_sn = [NS_TF2 stringValue];

    }

}
- (IBAction)singleTest_3:(NSButton *)sender
{

    if (!sender.state)
    {
        action3.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];

    }
    else
    {
        action3 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix3 withFileDir:foldDir withType:3];
        action3.resultTF = DUT_Result3_TF;//显示结果的lable
        action3.Log_View = C_LOG_TF;
        action3.dutTF    = NS_TF3;
        action3.isCancel=NO;
        [action3 setFoldDir:foldDir];
        [action3 setCsvTitle:plist.titile];
        [action3 setSw_ver:param.sw_ver];
        [action3 setSw_name:param.sw_name];
        action3.dut_sn = [NS_TF3 stringValue];



    }

}
- (IBAction)singleTest_4:(NSButton *)sender
{

    if (!sender.state)
    {
        action4.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];

    }
    else
    {
        action4 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix4 withFileDir:foldDir withType:4];
        action4.resultTF = DUT_Result4_TF;//显示结果的lable
        action4.Log_View = D_LOG_TF;
        action4.dutTF    = NS_TF4;
        action4.isCancel=NO;
        [action4 setFoldDir:foldDir];
        [action4 setCsvTitle:plist.titile];
        [action4 setSw_ver:param.sw_ver];
        [action4 setSw_name:param.sw_name];
        action4.dut_sn = [NS_TF4 stringValue];

    }

}

- (IBAction)singleTest_5:(NSButton *)sender
{
    
    if (!sender.state)
    {
        action5.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];
        
    }
    else
    {
        action5 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix5 withFileDir:foldDir withType:5];
        action5.resultTF = DUT_Result5_TF;//显示结果的lable
        action5.Log_View = E_LOG_TF;
        action5.dutTF    = NS_TF5;
        action5.isCancel=NO;
        [action5 setFoldDir:foldDir];
        [action5 setCsvTitle:plist.titile];
        [action5 setSw_ver:param.sw_ver];
        [action5 setSw_name:param.sw_name];
        action5.dut_sn = [NS_TF5 stringValue];

        
    }
    
}



- (IBAction)singleTest_6:(NSButton *)sender
{
    
    if (!sender.state)
    {
        action6.isCancel=YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"cancelCurrentThread" object:@""];
        
    }
    else
    {
        action6 = [[TestAction alloc]initWithTable:tab1 withFixDic:param.Fix6 withFileDir:foldDir withType:6];
        action6.resultTF = DUT_Result6_TF;//显示结果的lable
        action6.Log_View = E_LOG_TF;
        action6.dutTF    = NS_TF6;
        action6.isCancel=NO;
        [action6 setFoldDir:foldDir];
        [action6 setCsvTitle:plist.titile];
        [action6 setSw_ver:param.sw_ver];
        [action6 setSw_name:param.sw_name];
        action6.dut_sn = [NS_TF6 stringValue];

        
    }
    
}




#pragma mark=======================通知
//=============================================
-(void)selectSnChangeNoti:(NSNotification *)noti
{
     notiString = noti.object;
     totalNum++;
    
    if ([noti.object containsString:@"1"]) {
        
        fix_A_num = 101;
        noticeStr_A=noti.object;
        [notiAppendingString appendString:noti.object];
        NSLog(@"fixture_A 测试已经完成了");
    }
    if ([noti.object containsString:@"2"]) {
        
        fix_B_num = 102;
        noticeStr_B=noti.object;
        [notiAppendingString appendString:noti.object];

        NSLog(@"fixture_B 测试已经完成了");
    }
    if ([noti.object containsString:@"3"]) {
        
        fix_C_num = 103;
        noticeStr_C=noti.object;
        [notiAppendingString appendString:noti.object];

        NSLog(@"fixture_C 测试已经完成了");
    }
    if ([noti.object containsString:@"4"]) {
        
        fix_D_num = 104;
        noticeStr_D=noti.object;
        [notiAppendingString appendString:noti.object];

        NSLog(@"fixture_D 测试已经完成了");
    }
    if ([noti.object containsString:@"5"]) {
        
        fix_E_num = 105;
        noticeStr_E=noti.object;
        [notiAppendingString appendString:noti.object];
        
        NSLog(@"fixture_E 测试已经完成了");
    }
    if ([noti.object containsString:@"6"]) {
        
        fix_F_num = 106;
        noticeStr_F=noti.object;
        [notiAppendingString appendString:noti.object];
        
        NSLog(@"fixture_F 测试已经完成了");
    }
    
    //软件测试结束
    if (([notiAppendingString containsString:@"1"] || singleTest_1.state==0)&&([notiAppendingString containsString:@"2"] || singleTest_2.state==0)&&([notiAppendingString containsString:@"3"] || singleTest_3.state==0)&&([notiAppendingString containsString:@"4"] || singleTest_4.state==0)&&([notiAppendingString containsString:@"5"] || singleTest_5.state==0)&&([notiAppendingString containsString:@"6"] || singleTest_6.state==0)) {
        
        index = 107;
        notiAppendingString = [NSMutableString stringWithFormat:@""];
    }

}



#pragma mark------------重新设置放水和空气的时间
- (IBAction)resetAirandWater_action:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kResetAirAndWaterTime object:[NSString stringWithFormat:@"%@=%@=%@",[one_air_TF.stringValue length]>0?one_air_TF.stringValue:0,[water_in_TF.stringValue length]>0?water_in_TF.stringValue:0,[two_air_TF.stringValue  length]>0?two_air_TF.stringValue:0]];
    
}

- (IBAction)isAutoRange:(NSButton *)sender
{
    
}

- (IBAction)resetBtn:(NSButton *)sender
{
    if (index != 1000)
    {
        [mkTimer endTimer];
        [serialportA WriteLine:@"Fixture valve up"];
        index=0;
        return;
    }
    sender.enabled=NO;
    [serialportA Close];
    [NSThread sleepForTimeInterval:0.3];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"threadReset" object:@""];

}

-(void)WaterOffFinished_Noti:(NSNotification *)noti
{
    [mkTimer endTimer];
    [serialportA Open:fixture_uart_port_name_act];
    [serialportA WriteLine:@"Fixture valve up"];
    [NSThread sleepForTimeInterval:0.5];

    [Status_TF setStringValue:@"请重启软件测试..."];
    [Status_TF setBackgroundColor:[NSColor yellowColor]];
    index=1000;
}

-(void)WaterBegin_Noti:(NSNotification *)noti
{
    isWaterBegined=YES;
}

-(void)DisConnectFixture_A_Noti:(NSNotification *)noti
{
    [serialportA Close];
    index=1000;
}

-(void)ReConnectFixture_A_Noti:(NSNotification *)noti
{
    index=0;
}







//去掉回显
-(NSString *)backtringCut:(NSString *)backStr
{
    NSString *str;
    NSArray *arr=[backStr componentsSeparatedByString:@"\r\n"];
    if (arr.count>1) {
        
         str=arr[1];
    }
    else
    {
        str=@"";
    }
    return str;
}

-(void)countChange
{
    if (singleTest_1.state==1)
    {
        pcb1_count++;
        W_In1_Count++;
        W_Out1_Count++;
        Air_In1_Count++;
        Okins1_Count++;
        LH1_Count++;
        RZLT1_Count++;
        SUS1_Count++;
        M1_Count++;
    }
    
    if (singleTest_2.state==1)
    {
        pcb2_count++;
        W_In2_Count++;
        W_Out2_Count++;
        Air_In2_Count++;
        Okins2_Count++;
        LH2_Count++;
        RZLT2_Count++;
        SUS2_Count++;
        M2_Count++;
    }
    
    if (singleTest_3.state==1)
    {
        pcb3_count++;
        W_In3_Count++;
        W_Out3_Count++;
        Air_In3_Count++;
        Okins3_Count++;
        LH3_Count++;
        RZLT3_Count++;
        SUS3_Count++;
        M3_Count++;
    }
    
    if (singleTest_4.state==1)
    {
        pcb4_count++;
        W_In4_Count++;
        W_Out4_Count++;
        Air_In4_Count++;
        Okins4_Count++;
        LH4_Count++;
        RZLT4_Count++;
        SUS4_Count++;
        M4_Count++;
    }
    
    if (singleTest_5.state==1)
    {
        pcb5_count++;
        W_In5_Count++;
        W_Out5_Count++;
        Air_In5_Count++;
        Okins5_Count++;
        LH5_Count++;
        RZLT5_Count++;
        SUS5_Count++;
        M5_Count++;
    }
    
    if (singleTest_6.state==1)
    {
        pcb6_count++;
        W_In6_Count++;
        W_Out6_Count++;
        Air_In6_Count++;
        Okins6_Count++;
        LH6_Count++;
        RZLT6_Count++;
        SUS6_Count++;
        M6_Count++;
    }
}

-(void)showCountTimes
{
    PCB1_count.stringValue=[NSString stringWithFormat:@"%ld",pcb1_count];
    PCB2_count.stringValue=[NSString stringWithFormat:@"%ld",pcb2_count];
    PCB3_count.stringValue=[NSString stringWithFormat:@"%ld",pcb3_count];
    PCB4_count.stringValue=[NSString stringWithFormat:@"%ld",pcb4_count];
    PCB5_count.stringValue=[NSString stringWithFormat:@"%ld",pcb5_count];
    PCB6_count.stringValue=[NSString stringWithFormat:@"%ld",pcb6_count];
    
    W_IN1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In1_Count];
    W_IN2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In2_Count];
    W_IN3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In3_Count];
    W_IN4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In4_Count];
    W_IN5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In5_Count];
    W_IN6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_In6_Count];

    W_Out1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out1_Count];
    W_Out2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out2_Count];
    W_Out3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out3_Count];
    W_Out4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out4_Count];
    W_Out5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out5_Count];
    W_Out6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",W_Out6_Count];

    Air_In1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In1_Count];
    Air_In2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In2_Count];
    Air_In3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In3_Count];
    Air_In4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In4_Count];
    Air_In5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In5_Count];
    Air_In6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Air_In6_Count];

    Okins1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins1_Count];
    Okins2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins2_Count];
    Okins3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins3_Count];
    Okins4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins4_Count];
    Okins5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins5_Count];
    Okins6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",Okins6_Count];

    LH1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH1_Count];
    LH2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH2_Count];
    LH3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH3_Count];
    LH4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH4_Count];
    LH5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH5_Count];
    LH6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",LH6_Count];
    
    RZLT1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT1_Count];
    RZLT2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT2_Count];
    RZLT3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT3_Count];
    RZLT4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT4_Count];
    RZLT5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT5_Count];
    RZLT6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",RZLT6_Count];
    
    SUS1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS1_Count];
    SUS2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS2_Count];
    SUS3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS3_Count];
    SUS4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS4_Count];
    SUS5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS5_Count];
    SUS6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",SUS6_Count];
    
    M1_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M1_Count];
    M2_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M2_Count];
    M3_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M3_Count];
    M4_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M4_Count];
    M5_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M5_Count];
    M6_Count_TF.stringValue=[NSString stringWithFormat:@"%ld",M6_Count];


    //PCBA
    if (pcb1_count > 69000 && pcb1_count < 70000)
    {
        PCB1_Label.backgroundColor=[NSColor yellowColor];
        PCB1_Label.textColor=[NSColor blackColor];
    }
    else if (pcb1_count >= 70000)
    {
        PCB1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (pcb2_count > 69000 && pcb2_count < 70000)
    {
        PCB2_Label.backgroundColor=[NSColor yellowColor];
        PCB2_Label.textColor=[NSColor blackColor];
    }
    else if (pcb2_count >= 70000)
    {
        PCB2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (pcb3_count > 69000 && pcb3_count < 70000)
    {
        PCB3_Label.backgroundColor=[NSColor yellowColor];
        PCB3_Label.textColor=[NSColor blackColor];
    }
    else if (pcb3_count >= 70000)
    {
        PCB3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (pcb4_count > 69000 && pcb4_count < 70000)
    {
        PCB4_Label.backgroundColor=[NSColor yellowColor];
        PCB4_Label.textColor=[NSColor blackColor];
    }
    else if (pcb4_count >= 70000)
    {
        PCB4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (pcb5_count > 69000 && pcb5_count < 70000)
    {
        PCB5_Label.backgroundColor=[NSColor yellowColor];
        PCB5_Label.textColor=[NSColor blackColor];
    }
    else if (pcb5_count >= 70000)
    {
        PCB5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (pcb6_count > 69000 && pcb6_count < 70000)
    {
        PCB6_Label.backgroundColor=[NSColor yellowColor];
        PCB6_Label.textColor=[NSColor blackColor];
    }
    else if (pcb6_count >= 70000)
    {
        PCB6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        PCB6_Label.backgroundColor=[NSColor greenColor];
    }
    
    
    //单向阀-进水
    if (W_In1_Count > 19000 && W_In1_Count < 20000)
    {
        W_IN1_Lable.backgroundColor=[NSColor yellowColor];
        W_IN1_Lable.textColor=[NSColor blackColor];
    }
    else if (W_In1_Count >= 20000)
    {
        W_IN1_Lable.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN1_Lable.backgroundColor=[NSColor greenColor];
    }
    
    if (W_In2_Count > 19000 && W_In2_Count < 20000)
    {
        W_IN2_Label.backgroundColor=[NSColor yellowColor];
        W_IN2_Label.textColor=[NSColor blackColor];
    }
    else if (W_In2_Count >= 20000)
    {
        W_IN2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_In3_Count > 19000 && W_In3_Count < 20000)
    {
        W_IN3_Label.backgroundColor=[NSColor yellowColor];
        W_IN3_Label.textColor=[NSColor blackColor];
    }
    else if (W_In3_Count >= 20000)
    {
        W_IN3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_In4_Count > 19000 && W_In4_Count < 20000)
    {
        W_IN4_Label.backgroundColor=[NSColor yellowColor];
        W_IN4_Label.textColor=[NSColor blackColor];
    }
    else if (W_In4_Count >= 20000)
    {
        W_IN4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_In5_Count > 19000 && W_In5_Count < 20000)
    {
        W_IN5_Label.backgroundColor=[NSColor yellowColor];
        W_IN5_Label.textColor=[NSColor blackColor];
    }
    else if (W_In5_Count >= 20000)
    {
        W_IN5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_In6_Count > 19000 && W_In6_Count < 20000)
    {
        W_IN6_Label.backgroundColor=[NSColor yellowColor];
        W_IN6_Label.textColor=[NSColor blackColor];
    }
    else if (W_In6_Count >= 20000)
    {
        W_IN6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_IN6_Label.backgroundColor=[NSColor greenColor];
    }
    
    
    //单向阀-出水
    if (W_Out1_Count > 19000 && W_Out1_Count < 20000)
    {
        W_Out1_Label.backgroundColor=[NSColor yellowColor];
        W_Out1_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out1_Count >= 20000)
    {
        W_Out1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_Out2_Count > 19000 && W_Out2_Count < 20000)
    {
        W_Out2_Label.backgroundColor=[NSColor yellowColor];
        W_Out2_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out2_Count >= 20000)
    {
        W_Out2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_Out3_Count > 19000 && W_Out3_Count < 20000)
    {
        W_Out3_Label.backgroundColor=[NSColor yellowColor];
        W_Out3_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out3_Count >= 20000)
    {
        W_Out3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_Out4_Count > 19000 && W_Out4_Count < 20000)
    {
        W_Out4_Label.backgroundColor=[NSColor yellowColor];
        W_Out4_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out4_Count >= 20000)
    {
        W_Out4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_Out5_Count > 19000 && W_Out5_Count < 20000)
    {
        W_Out5_Label.backgroundColor=[NSColor yellowColor];
        W_Out5_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out5_Count >= 20000)
    {
        W_Out5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (W_Out6_Count > 19000 && W_Out6_Count < 20000)
    {
        W_Out6_Label.backgroundColor=[NSColor yellowColor];
        W_Out6_Label.textColor=[NSColor blackColor];
    }
    else if (W_Out6_Count >=20000)
    {
        W_Out6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        W_Out6_Label.backgroundColor=[NSColor greenColor];
    }
    

    //单向阀-进气
    if (Air_In1_Count > 19000 && Air_In1_Count < 20000)
    {
        Air_In1_Label.backgroundColor=[NSColor yellowColor];
        Air_In1_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In1_Count >= 20000)
    {
        Air_In1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Air_In2_Count > 19000 && Air_In2_Count < 20000)
    {
        Air_In2_Label.backgroundColor=[NSColor yellowColor];
        Air_In2_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In2_Count >= 20000)
    {
        Air_In2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Air_In3_Count > 19000 && Air_In3_Count < 20000)
    {
        Air_In3_Label.backgroundColor=[NSColor yellowColor];
        Air_In3_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In3_Count >= 20000)
    {
        Air_In3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Air_In4_Count > 19000 && Air_In4_Count < 20000)
    {
        Air_In4_Label.backgroundColor=[NSColor yellowColor];
        Air_In4_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In4_Count >= 20000)
    {
        Air_In4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Air_In5_Count > 19000 && Air_In5_Count < 20000)
    {
        Air_In5_Label.backgroundColor=[NSColor yellowColor];
        Air_In5_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In5_Count >= 20000)
    {
        Air_In5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Air_In6_Count > 19000 && Air_In6_Count < 20000)
    {
        Air_In6_Label.backgroundColor=[NSColor yellowColor];
        Air_In6_Label.textColor=[NSColor blackColor];
    }
    else if (Air_In6_Count >= 20000)
    {
        Air_In6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Air_In6_Label.backgroundColor=[NSColor greenColor];
    }
    
    
    

    //Okins
    if (Okins1_Count > 2800 && Okins1_Count < 3000)
    {
        Okins1_Label.backgroundColor=[NSColor yellowColor];
        Okins1_Label.textColor=[NSColor blackColor];
    }
    else if (Okins1_Count >= 3000)
    {
        Okins1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Okins2_Count > 2800 && Okins2_Count < 3000)
    {
        Okins2_Label.backgroundColor=[NSColor yellowColor];
        Okins2_Label.textColor=[NSColor blackColor];
    }
    else if (Okins2_Count >= 3000)
    {
        Okins2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Okins3_Count > 2800 && Okins3_Count < 3000)
    {
        Okins3_Label.backgroundColor=[NSColor yellowColor];
        Okins3_Label.textColor=[NSColor blackColor];
    }
    else if (Okins3_Count >= 3000)
    {
        Okins3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Okins4_Count > 2800 && Okins4_Count < 3000)
    {
        Okins4_Label.backgroundColor=[NSColor yellowColor];
        Okins4_Label.textColor=[NSColor blackColor];
    }
    else if (Okins4_Count >= 3000)
    {
        Okins4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Okins5_Count > 2800 && Okins5_Count < 3000)
    {
        Okins5_Label.backgroundColor=[NSColor yellowColor];
        Okins5_Label.textColor=[NSColor blackColor];
    }
    else if (Okins5_Count >= 3000)
    {
        Okins5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (Okins6_Count > 2800 && Okins6_Count < 3000)
    {
        Okins6_Label.backgroundColor=[NSColor yellowColor];
        Okins6_Label.textColor=[NSColor blackColor];
    }
    else if (Okins6_Count >= 3000)
    {
        Okins6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        Okins6_Label.backgroundColor=[NSColor greenColor];
    }
    
    
    

    //LH
    if (LH1_Count > 29000 && LH1_Count < 30000)
    {
        LH1_Label.backgroundColor=[NSColor yellowColor];
        LH1_Label.textColor=[NSColor blackColor];
    }
    else if (LH1_Count >= 30000)
    {
        LH1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (LH2_Count > 29000 && LH2_Count < 30000)
    {
        LH2_Label.backgroundColor=[NSColor yellowColor];
        LH2_Label.textColor=[NSColor blackColor];
    }
    else if (LH2_Count >= 30000)
    {
        LH2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (LH3_Count > 29000 && LH3_Count < 30000)
    {
        LH3_Label.backgroundColor=[NSColor yellowColor];
        LH3_Label.textColor=[NSColor blackColor];
    }
    else if (LH3_Count >= 30000)
    {
        LH3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (LH4_Count > 29000 && LH4_Count < 30000)
    {
        LH4_Label.backgroundColor=[NSColor yellowColor];
        LH4_Label.textColor=[NSColor blackColor];
    }
    else if (LH4_Count >= 30000)
    {
        LH4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (LH5_Count > 29000 && LH5_Count < 30000)
    {
        LH5_Label.backgroundColor=[NSColor yellowColor];
        LH5_Label.textColor=[NSColor blackColor];
    }
    else if (LH5_Count >= 30000)
    {
        LH5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (LH6_Count > 29000 && LH6_Count < 30000)
    {
        LH6_Label.backgroundColor=[NSColor yellowColor];
        LH6_Label.textColor=[NSColor blackColor];
    }
    else if (LH6_Count >= 30000)
    {
        LH6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        LH6_Label.backgroundColor=[NSColor greenColor];
    }

    //RZLT
    if (RZLT1_Count > 19000 && RZLT1_Count < 20000)
    {
        RTZL1_Label.backgroundColor=[NSColor yellowColor];
        RTZL1_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT1_Count >= 20000)
    {
        RTZL1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (RZLT2_Count > 19000 && RZLT2_Count < 20000)
    {
        RTZL2_Label.backgroundColor=[NSColor yellowColor];
        RTZL2_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT2_Count >= 20000)
    {
        RTZL2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (RZLT3_Count > 19000 && RZLT3_Count < 20000)
    {
        RTZL3_Label.backgroundColor=[NSColor yellowColor];
        RTZL3_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT3_Count >= 20000)
    {
        RTZL3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (RZLT4_Count > 19000 && RZLT4_Count < 20000)
    {
        RTZL4_Label.backgroundColor=[NSColor yellowColor];
        RTZL4_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT4_Count >= 20000)
    {
        RTZL4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (RZLT5_Count > 19000 && RZLT5_Count < 20000)
    {
        RTZL5_Label.backgroundColor=[NSColor yellowColor];
        RTZL5_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT5_Count >= 20000)
    {
        RTZL5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (RZLT6_Count > 19000 && RZLT6_Count < 20000)
    {
        RTZL6_Label.backgroundColor=[NSColor yellowColor];
        RTZL6_Label.textColor=[NSColor blackColor];
    }
    else if (RZLT6_Count >= 20000)
    {
        RTZL6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        RTZL6_Label.backgroundColor=[NSColor greenColor];
    }
    

    //SUS
    if (SUS1_Count > 19000 && SUS1_Count < 20000)
    {
        SUS1_Label.backgroundColor=[NSColor yellowColor];
        SUS1_Label.textColor=[NSColor blackColor];
    }
    else if (SUS1_Count >= 20000)
    {
        SUS1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS1_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (SUS2_Count > 19000 && SUS2_Count < 20000)
    {
        SUS2_Label.backgroundColor=[NSColor yellowColor];
        SUS2_Label.textColor=[NSColor blackColor];
    }
    else if (SUS2_Count >= 20000)
    {
        SUS2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS2_Label.backgroundColor=[NSColor greenColor];
    }

    
    if (SUS3_Count > 19000 && SUS3_Count < 20000)
    {
        SUS3_Label.backgroundColor=[NSColor yellowColor];
        SUS3_Label.textColor=[NSColor blackColor];
    }
    else if (SUS3_Count >= 20000)
    {
        SUS3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS3_Label.backgroundColor=[NSColor greenColor];
    }

    
    if (SUS4_Count > 19000 && SUS4_Count < 20000)
    {
        SUS4_Label.backgroundColor=[NSColor yellowColor];
        SUS4_Label.textColor=[NSColor blackColor];
    }
    else if (SUS4_Count >= 20000)
    {
        SUS4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS4_Label.backgroundColor=[NSColor greenColor];
    }

    
    if (SUS5_Count > 19000 && SUS5_Count < 20000)
    {
        SUS5_Label.backgroundColor=[NSColor yellowColor];
        SUS5_Label.textColor=[NSColor blackColor];
    }
    else if (SUS5_Count >= 20000)
    {
        SUS5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS5_Label.backgroundColor=[NSColor greenColor];
    }

    
    if (SUS6_Count > 19000 && SUS6_Count < 20000)
    {
        SUS6_Label.backgroundColor=[NSColor yellowColor];
        SUS6_Label.textColor=[NSColor blackColor];
    }
    else if (SUS6_Count >= 20000)
    {
        SUS6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        SUS6_Label.backgroundColor=[NSColor greenColor];
    }

    
    

    //Model
    if (M1_Count > 14000 && M1_Count < 15000)
    {
        M1_Label.backgroundColor=[NSColor yellowColor];
        M1_Label.textColor=[NSColor blackColor];
    }
    else if (M1_Count >= 15000)
    {
        M1_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M1_Label.backgroundColor=[NSColor greenColor];
    }

    
    if (M2_Count > 14000 && M2_Count < 15000)
    {
        M2_Label.backgroundColor=[NSColor yellowColor];
        M2_Label.textColor=[NSColor blackColor];
    }
    else if (M2_Count >= 15000)
    {
        M2_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M2_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (M3_Count > 14000 && M3_Count < 15000)
    {
        M3_Label.backgroundColor=[NSColor yellowColor];
        M3_Label.textColor=[NSColor blackColor];
    }
    else if (M3_Count >= 15000)
    {
        M3_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M3_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (M4_Count > 14000 && M4_Count < 15000)
    {
        M4_Label.backgroundColor=[NSColor yellowColor];
        M4_Label.textColor=[NSColor blackColor];
    }
    else if (M4_Count >= 15000)
    {
        M4_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M4_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (M5_Count > 14000 && M5_Count < 15000)
    {
        M5_Label.backgroundColor=[NSColor yellowColor];
        M5_Label.textColor=[NSColor blackColor];
    }
    else if (M5_Count >= 15000)
    {
        M5_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M5_Label.backgroundColor=[NSColor greenColor];
    }
    
    if (M6_Count > 14000 && M6_Count < 15000)
    {
        M6_Label.backgroundColor=[NSColor yellowColor];
        M6_Label.textColor=[NSColor blackColor];
    }
    else if (M6_Count >= 15000)
    {
        M6_Label.backgroundColor=[NSColor redColor];
    }
    else
    {
        M6_Label.backgroundColor=[NSColor greenColor];
    }
    
    

    
    
    
   
}

-(void)MonitorThread
{
    while ([[NSThread currentThread] isCancelled]==NO)
    {
        [NSThread sleepForTimeInterval:0.5];
        if ([serialportA IsOpen])
        {
            backString_ABoard=[serialportA ReadExisting];
            if (![backString_ABoard isEqualToString:@""])
            {
                NSLog(@"主线程：%@",backString_ABoard);
            }
            if ([backString_ABoard containsString:@"scram on"] || [backString_ABoard containsString:@"End"])
            {
                [self UpdateTextView:@"接收到中断" andClear:NO andTextView:Log_View];
                [mkTimer endTimer];
                [serialportA Close];
                [NSThread sleepForTimeInterval:0.5];
                index=0;
            }
            else if([backString_ABoard containsString:@"Start"])
            {
                startbutton.enabled=NO;
                [self UpdateTextView:@"双启动开始" andClear:NO andTextView:Log_View];
            }
            else if ([backString_ABoard containsString:@">>OK Fixture valve down"])
            {
                [serialportA Close];
                [NSThread sleepForTimeInterval:0.5];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NSThreadStart_Notification" object:@""];
            }
            else
            {
                
            }

        }
        
    }
}



//=============================================


-(void)Working
{
    while ([[NSThread currentThread] isCancelled]==NO) //线程未结束一直处于循环状态
    {
#pragma mark-------------//index=0,连接治具A
        if (index==0)
        {
            fixture_uart_port_name=param.Fix1[@"fixture_uart_port_name"];
            fixture_uart_port_name_e=param.Fix1[@"fixture_uart_port_name_e"];
            BOOL isCollect = [serialportA Open:fixture_uart_port_name];
            fixture_uart_port_name_act=fixture_uart_port_name;
            if (!isCollect)
            {
                isCollect = [serialportA Open:fixture_uart_port_name_e];
                fixture_uart_port_name_act=fixture_uart_port_name_e;
            }
            if (isCollect)
            {
                NSLog(@"index= 0,连接治具%@",fixture_uart_port_name_act);
                [self UpdateTextView:@"index=0,治具已经连接" andClear:NO andTextView:Log_View];
                index =1;
            }
            
            if (param.isDebug)
            {
                index=1;
            }
        }
        
#pragma mark-------------//index=1,输入 SN
        if (index == 1) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [Status_TF setStringValue:@"index=1,请输入 SN!"];
                [Status_TF setBackgroundColor:[NSColor greenColor]];
                resetBtn.enabled=YES;
            });
            [NSThread sleepForTimeInterval:0.3];
            if (controlLog==0)
            {
                [self UpdateTextView:@"index=1,请输入SN" andClear:NO andTextView:Log_View];
            }
            controlLog=1;
             dispatch_sync(dispatch_get_main_queue(), ^{
                if (([NS_TF1.stringValue length]==17 ||[NS_TF1.stringValue length]==4 || singleTest_1.state==0)&&([NS_TF2.stringValue length]==17 ||[NS_TF2.stringValue length]==4 || singleTest_2.state==0)&&([NS_TF3.stringValue length]==17 ||[NS_TF3.stringValue length]==4 || singleTest_3.state==0)&&([NS_TF4.stringValue length]==17 ||[NS_TF4.stringValue length]==4 || singleTest_4.state==0) &&([NS_TF5.stringValue length]==17 ||[NS_TF5.stringValue length]==4 || singleTest_5.state==0) &&([NS_TF6.stringValue length]==17 ||[NS_TF6.stringValue length]==4 || singleTest_6.state==0) && !(singleTest_1.state==0 && singleTest_2.state==0 && singleTest_3.state==0 && singleTest_4.state==0 && singleTest_5.state==0 && singleTest_6.state==0))
                {
                    startbutton.enabled = YES;
                    [NSThread sleepForTimeInterval:0.2];
                    index = 2;

                }
                
            });
        }
        
        
        
#pragma mark-------------//index=2,点击“开始”进行测试
        if (index == 2) { //判断当前配置文件和changeID等配置
            
            [NSThread sleepForTimeInterval:0.1];
            dispatch_async(dispatch_get_main_queue(), ^{
                [Status_TF setStringValue:@"index=1,请点击“开始”进行测试!"];
                [Status_TF setBackgroundColor:[NSColor greenColor]];

                });
                [self UpdateTextView:@"index=2,请点击“开始”进行测试!" andClear:NO andTextView:Log_View];
                index = 3;
            
        }
        
#pragma mark-------------//index=3,治具下压，进入子线程测试
        if (index == 3)
        {
            
            [NSThread sleepForTimeInterval:0.1];
            if (startbutton.enabled == NO)
            {
                [self countChange];
                
                action1.dut_sn = [NS_TF1 stringValue];
                action2.dut_sn = [NS_TF2 stringValue];
                action3.dut_sn = [NS_TF3 stringValue];
                action4.dut_sn = [NS_TF4 stringValue];
                action5.dut_sn = [NS_TF5 stringValue];
                action6.dut_sn = [NS_TF6 stringValue];

                action1.isAuto=isAutoRange.state;
                action2.isAuto=isAutoRange.state;
                action3.isAuto=isAutoRange.state;
                action4.isAuto=isAutoRange.state;
                action5.isAuto=isAutoRange.state;
                action6.isAuto=isAutoRange.state;

                [tab1 ClearTable]; //清理界面
                [testFieldTimes setStringValue:@"0"];
                [mkTimer setTimer:0.1];
                [mkTimer startTimerWithTextField:testFieldTimes];
                ct_cnt = 1;

               
                [serialportA WriteLine:@"Fixture valve down"];
                [NSThread sleepForTimeInterval:0.5];
                [self creat_TotalFile];
                dispatch_async(dispatch_get_main_queue(), ^{

                    [Status_TF setStringValue:@"index=3,测试中..."];
                    [Status_TF setBackgroundColor:[NSColor greenColor]];
                    [self showCountTimes];
                    [self saveCountLogWithString];
                });
                
                if (param.isDebug)
                {
                    [serialportA Close];
                    [NSThread sleepForTimeInterval:0.5];
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"NSThreadStart_Notification" object:@""];
                }
                
                
                index = 1000;
            }
        }
        

    
        
#pragma mark-------------//index=101,A治具测试结束，发送指令信号灯
        if (fix_A_num == 101) {
            
            isFix_A_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"治具A测试完毕，灯光操作完成");
            fix_A_num = 0;
            noticeStr_A=@"";
            
        }
        
        
#pragma mark-------------//index=102,B治具测试结束，发送指令信号灯
        if (fix_B_num == 102) {
            
            isFix_B_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"102--passnum=%d",passNum);
            NSLog(@"治具B测试完毕，灯光操作完成");
            fix_B_num =0;
            noticeStr_B=@"";
            
        }
        
#pragma mark-------------//index=103,C治具测试结束，发送指令信号灯
        if (fix_C_num == 103) {
            
            isFix_C_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
             NSLog(@"103--passnum=%d",passNum);
            NSLog(@"治具C测试完毕，灯光操作完成");
            fix_C_num = 0;
            noticeStr_C=@"";
            
        }
        
        
#pragma mark-------------//index=104,D治具测试结束，发送指令信号灯
        if (fix_D_num == 104) { //扫描SN
            
            isFix_D_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"治具D测试完毕，灯光操作完成");
            fix_D_num = 0;
            noticeStr_D=@"";
            
        }
        
#pragma mark-------------//index=105,E治具测试结束，发送指令信号灯
        if (fix_E_num == 105) { //扫描SN
            
            isFix_E_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"105--passnum=%d",passNum);
            NSLog(@"治具E测试完毕，灯光操作完成");
            fix_E_num = 0;
            noticeStr_E=@"";
            
        }
        
#pragma mark-------------//index=106,F治具测试结束，发送指令信号灯
        if (fix_F_num == 106) { //扫描SN
            
            isFix_F_Done=YES;
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"106--passnum=%d",passNum);
            NSLog(@"治具F测试完毕，灯光操作完成");
            fix_F_num = 0;
            noticeStr_F=@"";
            
        }
  
#pragma mark-------------//index=105,所有软件测试结束
        if (index == 107 || isFinish)
        {
            
            controlLog=0;
            if (!isFix_A_Done && singleTest_1.state==1)
            {
                index=101;
                isFinish=YES;
            }
            else if (!isFix_B_Done && singleTest_2.state==1)
            {
                index=102;
                isFinish=YES;
            }
            else if (!isFix_C_Done && singleTest_3.state==1)
            {
                index=103;
                isFinish=YES;
            }
            else if (!isFix_D_Done && singleTest_4.state==1)
            {
                index=104;
                isFinish=YES;
            }
            else if (!isFix_E_Done && singleTest_5.state==1)
            {
                index=105;
                isFinish=YES;
            }
            else if (!isFix_F_Done && singleTest_6.state==1)
            {
                index=106;
                isFinish=YES;
            }
            else
            {
                isWaterBegined=NO;
                
                [serialportA Open:fixture_uart_port_name_act];
                    isFix_A_Done=NO;
                    isFix_B_Done=NO;
                    isFix_C_Done=NO;
                    isFix_D_Done=NO;
                    isFix_E_Done=NO;
                    isFix_F_Done=NO;
                    isFinish    =NO;
                
                [NSThread sleepForTimeInterval:0.5];
                [serialportA WriteLine:@"Fixture valve up"];
                [NSThread sleepForTimeInterval:0.5];
                [serialportA Close];
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                [Status_TF setStringValue:@"index=3,测试结束！"];
                [Status_TF setBackgroundColor:[NSColor greenColor]];
                    
                [TestCount_TF setStringValue:[NSString stringWithFormat:@"%d/%d",app.passNum,totalNum]];
                    //========定时器结束========
                [mkTimer endTimer];
                ct_cnt = 0;
                makesure_button.enabled = YES;
                one_air_TF.enabled = YES;
                two_air_TF.enabled = YES;
                water_in_TF.enabled = YES;
                    
                    
                    
                });


                index = 0;
            }
            
            
            
            
                   
           

            
        }
        
        

        
        
#pragma mark-------------//index=1000,测试结束
        if (index == 1000) { //等待测试结束，并返回测试的结果
            [NSThread sleepForTimeInterval:0.5];
        }

   
    }
    
    
}






//创建A,B,C,D治具对应的文件ABCD
-(void)creat_TotalFile
{
    
    
    NSString  *  day = [[GetTimeDay shareInstance] getCurrentDay];
    
    foldDir = [NSString stringWithFormat:@"%@/%@/%@_%@",foldDir_tmp,day,param.sw_name,param.sw_ver];
 
 
    [action1 setFoldDir:foldDir];
    [action2 setFoldDir:foldDir];
    [action3 setFoldDir:foldDir];
    [action4 setFoldDir:foldDir];
    [action5 setFoldDir:foldDir];
    [action6 setFoldDir:foldDir];



    
    
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_A.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_B.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_C.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_D.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_E.csv",foldDir,day]];
    [self createFileWithstr:[NSString stringWithFormat:@"%@/%@_F.csv",foldDir,day]];
    
   
    
}


/**
 *  生成文件
 *
 *  @param fileString 文件的地址
 */
-(void)createFileWithstr:(NSString *)fileString
{
    while (YES) {
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileString]) {
            break;
        }
        else
        {
            
            [fold Folder_Creat:foldDir];
            [csvFile CSV_Open:fileString];
            [csvFile CSV_Write:plist.titile];
        }
        
    }

}





#pragma mark 控制光标 成为第一响应者

-(void)controlTextDidChange:(NSNotification *)obj{
    
    NSTextField *tf = (NSTextField *)obj.object;
    
    if (tf.tag == 6) {
        
        [tf setEditable:YES];
    }
    
    if (tf.stringValue.length == 4) {
        
        NSTextField *nextTF = [self.view viewWithTag:tf.tag+1];
        
        if (nextTF) {
            
            
            if (nextTF.tag == 6) {
                
                [nextTF setEditable:YES];
                
            }
            [tf resignFirstResponder];
            [nextTF becomeFirstResponder];
            
        }
        if (tf.tag == 6 ) {
            
            [tf setEditable:NO];
            
        }
    }
}






//更新upodateView
-(void)UpdateTextView:(NSString*)strMsg andClear:(BOOL)flagClearContent andTextView:(NSTextView *)textView
{
    if (flagClearContent)
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [textView setString:@""];
                       });
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           if ([[textView string]length]>0)
                           {
                               NSString * messageString = [NSString stringWithFormat:@"%@: %@\n",[[GetTimeDay shareInstance] getFileTime],strMsg];
                               NSRange range = NSMakeRange([textView.textStorage.string length] , messageString.length);
                               [textView insertText:messageString replacementRange:range];
                               
                           }
                           else
                           {
                                NSString * messageString = [NSString stringWithFormat:@"%@: %@\n",[[GetTimeDay shareInstance] getFileTime],strMsg];
                               [textView setString:[NSString stringWithFormat:@"%@\n",messageString]];
                           }
                           
                               [textView setTextColor:[NSColor redColor]];
                           
                       });
    }
}









-(void)viewWillDisappear
{
    if (action1 != nil) {
        
        [action1 threadEnd];
        action1 = nil;
    }
    if (action2 != nil) {
        
        [action2 threadEnd];
        action2 = nil;
    }
    if (action3 != nil) {
        
        [action3 threadEnd];
        action3 = nil;
    }
    if (action4 != nil) {
        
        [action4 threadEnd];
        action4 = nil;
    }
    if (action5 != nil) {
        
        [action5 threadEnd];
        action5 = nil;
    }
    if (action6 != nil) {
        
        [action6 threadEnd];
        action6 = nil;
    }
    [NSThread sleepForTimeInterval:1];
    exit(1);
}


-(void)saveCountLogWithString
{
    NSString *string=[NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n%@,%@,%@,%@,%@,%@\n",PCB1_count.stringValue,PCB2_count.stringValue,PCB3_count.stringValue,PCB4_count.stringValue,PCB5_count.stringValue,PCB6_count.stringValue,W_IN1_Count_TF.stringValue,W_IN2_Count_TF.stringValue,W_IN3_Count_TF.stringValue,W_IN4_Count_TF.stringValue,W_IN5_Count_TF.stringValue,W_IN6_Count_TF.stringValue,W_Out1_Count_TF.stringValue,W_Out2_Count_TF.stringValue,W_Out3_Count_TF.stringValue,W_Out4_Count_TF.stringValue,W_Out5_Count_TF.stringValue,W_Out6_Count_TF.stringValue,Air_In1_Count_TF.stringValue,Air_In2_Count_TF.stringValue,Air_In3_Count_TF.stringValue,Air_In4_Count_TF.stringValue,Air_In5_Count_TF.stringValue,Air_In6_Count_TF.stringValue,Okins1_Count_TF.stringValue,Okins2_Count_TF.stringValue,Okins3_Count_TF.stringValue,Okins4_Count_TF.stringValue,Okins5_Count_TF.stringValue,Okins6_Count_TF.stringValue,LH1_Count_TF.stringValue,LH2_Count_TF.stringValue,LH3_Count_TF.stringValue,LH4_Count_TF.stringValue,LH5_Count_TF.stringValue,LH6_Count_TF.stringValue,RZLT1_Count_TF.stringValue,RZLT2_Count_TF.stringValue,RZLT3_Count_TF.stringValue,RZLT4_Count_TF.stringValue,RZLT5_Count_TF.stringValue,RZLT6_Count_TF.stringValue,SUS1_Count_TF.stringValue,SUS2_Count_TF.stringValue,SUS3_Count_TF.stringValue,SUS4_Count_TF.stringValue,SUS5_Count_TF.stringValue,SUS6_Count_TF.stringValue,M1_Count_TF.stringValue,M2_Count_TF.stringValue,M3_Count_TF.stringValue,M4_Count_TF.stringValue,M5_Count_TF.stringValue,M6_Count_TF.stringValue];
    
    NSString * logPath=@"/vault/EW_Count_Log";
    
    [[MK_FileFolder shareInstance] createOrFlowFolderWithCurrentPath:logPath];
    
    [[MK_FileTXT shareInstance] createOrFlowTXTFileWithFolderPath:logPath FileName:@"EW_Count_Log" Content:string];
}

-(void)saveMaintainLogWithString:(NSString *)string AndCount:(NSInteger)count
{    
    NSString *str=[NSString stringWithFormat:@"%@ 进行了更换，更换前使用次数为%ld",string,count];
    NSString * logPath=@"/vault/SIRT_Maintain_Log";
    
    [[MK_FileFolder shareInstance] createOrFlowFolderWithCurrentPath:logPath];
    
    [[MK_FileTXT shareInstance] createOrFlowTXTFileWithFolderPath:logPath FileName:@"SIRT_Maintain_Log" Content:str];
}



-(void)viewDidDisappear
{
    exit(0);
}


- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

@end
