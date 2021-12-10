//
//  TouchID.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/19.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "TouchID.h"

@implementation TouchID

+(instancetype)Touch_ID{
    TouchID *touchID = TouchID.new;
    //创建LAContext
    LAContext* context = LAContext.new;
    NSError* error = nil;
    NSString* result = @"请验证已有指纹";
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:result
                          reply:^(BOOL success, NSError *error) {
            if (success) {
                //验证成功，主线程处理UI
                NSLog(@"验证成功、主线程处理UI");
                touchID.MyBlock_TouchID_Success_Or_Error(TouchID_Success);//1
            }else{
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:{
                        //系统取消授权，如其他APP切入
                        NSLog(@"系统取消授权，如其他APP切入");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_1);//2
                        break;
                    }case LAErrorUserCancel:{
                        //用户取消验证Touch ID
                        NSLog(@"用户取消验证Touch ID");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_2);//3
                        break;
                    }case LAErrorAuthenticationFailed:{
                        //授权失败
                        NSLog(@"授权失败");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_3);//4
                        break;
                    }case LAErrorPasscodeNotSet:{
                        //系统未设置密码
                        NSLog(@"系统未设置密码");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_4);//5
                        break;
                    }case LAErrorTouchIDNotAvailable:{
                        //设备Touch ID不可用、例如未打开
                        NSLog(@"设备Touch ID不可用、例如未打开");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_5);//6
                        break;
                    }case LAErrorTouchIDNotEnrolled:{
                        //设备Touch ID不可用、用户未录入
                        NSLog(@"设备Touch ID不可用、用户未录入");
                        touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_6);//7
                        break;
                    }case LAErrorUserFallback:{
                        [NSOperationQueue.mainQueue addOperationWithBlock:^{
                            //用户选择输入密码、切换主线程处理
                            NSLog(@"用户选择输入密码、切换主线程处理");
                            touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_7);//8
                        }];break;
                    }default:{
                        [NSOperationQueue.mainQueue addOperationWithBlock:^{
                            //其他情况、切换主线程处理
                            NSLog(@"其他情况、切换主线程处理");
                            touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_8);//9
                        }];break;
                    }
                }
            }
        }];
    }else{
        //不支持指纹识别，LOG出错误详情
        NSLog(@"不支持指纹识别");
        touchID.MyBlock_TouchID_Success_Or_Error(TouchID_Error);
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:{
                NSLog(@"TouchID is not enrolled");
                touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_9);//10
                break;
            }case LAErrorPasscodeNotSet:{
                NSLog(@"A passcode has not been set");
                touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_10);//11
                break;
            }default:{
                NSLog(@"TouchID not available");
                touchID.MyBlock_TouchID_Style_Details(TouchIDStyle_11);//12
                break;
            }
        }NSLog(@"%@",error.localizedDescription);
    }return touchID;
}

@end
