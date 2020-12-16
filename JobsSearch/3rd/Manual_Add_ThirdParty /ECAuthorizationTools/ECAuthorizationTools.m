//
//  ECAuthorizationTools.m
//  ECAuthorizationTools
//
//  Created by EchoZuo on 2017/6/20.
//  Copyright © 2017年 Echo.Z. All rights reserved.
//

#import "ECAuthorizationTools.h"

API_AVAILABLE(ios(10.0))
@interface ECAuthorizationTools ()
<
CLLocationManagerDelegate
,CBCentralManagerDelegate
,HMHomeManagerDelegate
,UINavigationControllerDelegate
>

@property(nonatomic,copy)void(^kCLCallBackBlock)(CLAuthorizationStatus state);
@property(nonatomic,copy)void(^CBManagerStateCallBackBlock)(CBManagerState state);
@property(nonatomic,copy)void(^HomeAccessCallBackBlock)(BOOL isHaveAccess);

@end

@implementation ECAuthorizationTools

#pragma mark - checkAndRequestAccessForType
+ (void)checkAndRequestAccessForType:(ECPrivacyType)type
                        accessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    if (type == ECPrivacyType_LocationServices) {           // 定位服务
//        [self checkAndRequestAccessForLocationServicesWithAccessStatus:accessStatusCallBack];
    }else if (type == ECPrivacyType_Contacts) {             // 联系人
        [self checkAndRequestAccessForContactsWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                   ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_Calendars) {            // 日历
        [self checkAndRequestAccessForCalendarsWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                    ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_Reminders) {            // 提醒事项
        [self checkAndRequestAccessForRemindersWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                    ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type ==  ECPrivacyType_Photos) {              // 照片
        [self checkAndRequestAccessForPhotosWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                 ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_BluetoothSharing) {     // 蓝牙
//        [self checkAndRequestAccessForBluetoothSharingWithAccessStatus:accessStatusCallBack];
    }else if (type == ECPrivacyType_Microphone) {           // 麦克风
        [self checkAndRequestAccessForMicrophoneWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                     ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_SpeechRecognition) {    // 语音识别
        [self checkAndRequestAccessForSpeechRecognitionWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                            ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_Camera) {               // 相机
        [self checkAndRequestAccessForCameraWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                 ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_Health) {               // 健康
//        [self checkAndRequestAccessForHealthWithAccessStatus:accessStatusCallBack];
    }else if (type == ECPrivacyType_HomeKit) {              // home
//        [self checkAndRequestAccessForHomeWithAccessStatus:accessStatusCallBack];
    }else if (type == ECPrivacyType_MediaAndAppleMusic) {   // Apple Music
        [self checkAndRequestAccessForAppleMusicWithAccessStatus:^id(ECAuthorizationStatus status,
                                                                     ECPrivacyType type) {
            accessStatusCallBack(status,type);
            return nil;
        }];
    }else if (type == ECPrivacyType_MotionAndFitness) {     // Motion
//        [self checkAndRequestAccessForMotionAndFitnessWtihAccessStatus:accessStatusCallBack];
    }else{
        // ECPrivacyType_None
    }
}
#pragma mark -------------------- LocationServices --------------------
- (void)checkAndRequestAccessForLocationServicesWithAccessStatus:(AccessForLocationResultBlock)accessStatusCallBack{
    BOOL isLocationServicesEnabled = [CLLocationManager locationServicesEnabled];
    if (!isLocationServicesEnabled) {
        NSLog(@"定位服务不可用，例如定位没有打开...");
        [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                       accessStatus:ECLocationAuthorizationStatus_NotSupport
                                               type:ECPrivacyType_LocationServices];
    }else{
        CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
        if (status == kCLAuthorizationStatusNotDetermined) {
//            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
//                                           accessStatus:ECLocationAuthorizationStatus_NotDetermined
//                                                   type:ECPrivacyType_LocationServices];
            // 两种定位模式：[self.locationManager requestAlwaysAuthorization];
            [self.locationManager requestWhenInUseAuthorization];
            [self setKCLCallBackBlock:^(CLAuthorizationStatus state){
                if (status == kCLAuthorizationStatusNotDetermined) {
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                   accessStatus:ECLocationAuthorizationStatus_NotDetermined
                                                           type:ECPrivacyType_LocationServices];
                }else if (status == kCLAuthorizationStatusRestricted) {
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                                   accessStatus:ECLocationAuthorizationStatus_Restricted
                                                                           type:ECPrivacyType_LocationServices];
                }else if (status == kCLAuthorizationStatusDenied) {
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                                   accessStatus:ECLocationAuthorizationStatus_Restricted
                                                                           type:ECPrivacyType_LocationServices];
                }else if (status == kCLAuthorizationStatusAuthorizedAlways) {
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                                   accessStatus:ECLocationAuthorizationStatus_AuthorizedAlways
                                                                           type:ECPrivacyType_LocationServices];
                }else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                                   accessStatus:ECLocationAuthorizationStatus_AuthorizedWhenInUse
                                                                           type:ECPrivacyType_LocationServices];
                }else{
                    // kCLAuthorizationStatusAuthorized < ios8
                    [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                                   accessStatus:ECLocationAuthorizationStatus_Authorized
                                                                           type:ECPrivacyType_LocationServices];
                }
            }];
        }else if (status == kCLAuthorizationStatusRestricted) {
            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                           accessStatus:ECLocationAuthorizationStatus_Restricted
                                                                   type:ECPrivacyType_LocationServices];
        }else if (status == kCLAuthorizationStatusDenied) {
            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                           accessStatus:ECLocationAuthorizationStatus_Restricted
                                                                   type:ECPrivacyType_LocationServices];
        }else if (status == kCLAuthorizationStatusAuthorizedAlways) {
            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                           accessStatus:ECLocationAuthorizationStatus_AuthorizedAlways
                                                                   type:ECPrivacyType_LocationServices];
        }else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                           accessStatus:ECLocationAuthorizationStatus_AuthorizedWhenInUse
                                                                   type:ECPrivacyType_LocationServices];
        }else{
            // kCLAuthorizationStatusAuthorized < ios8
            [ECAuthorizationTools executeCallBackForForLocationServices:accessStatusCallBack
                                                           accessStatus:ECLocationAuthorizationStatus_Authorized
                                                                   type:ECPrivacyType_LocationServices];
        }
    }
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if (self.kCLCallBackBlock) {
        self.kCLCallBackBlock(status);
    }
}

#pragma mark -------------------- Contacts --------------------
+ (void)checkAndRequestAccessForContactsWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    if (@available(iOS 9.0, *)) {
        CNContactStore *contactStore = CNContactStore.new;
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (status == CNAuthorizationStatusNotDetermined) {
            if (!contactStore) {
                [self executeCallBack:accessStatusCallBack
                         accessStatus:ECAuthorizationStatus_NotSupport
                                 type:ECPrivacyType_Contacts];
            }
            [contactStore requestAccessForEntityType:CNEntityTypeContacts
                                   completionHandler:^(BOOL granted,
                                                       NSError * _Nullable error) {
                                       if (error) {
                                           NSLog(@"error:%@",error);
                                           [self executeCallBack:accessStatusCallBack
                                                    accessStatus:ECAuthorizationStatus_NotSupport
                                                            type:ECPrivacyType_Contacts];
                                       }else{
                                           if (granted) {
                                               [self executeCallBack:accessStatusCallBack
                                                        accessStatus:ECAuthorizationStatus_Authorized
                                                                type:ECPrivacyType_Contacts];
                                           }else{
                                               [self executeCallBack:accessStatusCallBack
                                                        accessStatus:ECAuthorizationStatus_Denied
                                                                type:ECPrivacyType_Contacts];
                                           }
                                       }
                                   }];
        }else if (status == CNAuthorizationStatusRestricted) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Restricted
                             type:ECPrivacyType_Contacts];
        }else if (status == CNAuthorizationStatusDenied) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Denied
                             type:ECPrivacyType_Contacts];
        }else{
            // CNAuthorizationStatusAuthorized
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Authorized
                             type:ECPrivacyType_Contacts];
        }
    }else{}
}
#pragma mark -------------------- Calendars --------------------
+ (void)checkAndRequestAccessForCalendarsWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status == EKAuthorizationStatusNotDetermined) {
//        [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Calendars];
        EKEventStore *store = EKEventStore.new;
        if (!store) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_NotSupport
                             type:ECPrivacyType_Calendars];
        }else{
            @weakify(self)
            [store requestAccessToEntityType:EKEntityTypeEvent
                                  completion:^(BOOL granted,
                                               NSError * _Nullable error) {
                                      @strongify(self)
                                      if (error) {
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Denied
                                                           type:ECPrivacyType_Calendars];
                                          NSLog(@"erro:%@",error);
                                      }
                                      if (granted) {
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Authorized
                                                           type:ECPrivacyType_Calendars];
                                      }else{
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Denied
                                                           type:ECPrivacyType_Calendars];
                                      }
                                  }];
        }
    } else if (status == EKAuthorizationStatusRestricted) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Restricted
                         type:ECPrivacyType_Calendars];
    } else if (status == EKAuthorizationStatusDenied) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Denied
                         type:ECPrivacyType_Calendars];
    } else {
        // EKAuthorizationStatusAuthorized
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Authorized
                         type:ECPrivacyType_Calendars];
    }
}
#pragma mark -------------------- Reminders --------------------
+ (void)checkAndRequestAccessForRemindersWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];
    if (status == EKAuthorizationStatusNotDetermined) {
//        [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Reminders];
        EKEventStore *store = EKEventStore.new;
        if (!store) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_NotSupport
                             type:ECPrivacyType_Reminders];
        }else{
            @weakify(self)
            [store requestAccessToEntityType:EKEntityTypeReminder
                                  completion:^(BOOL granted,
                                               NSError * _Nullable error) {
                                      @strongify(self)
                                      if (error) {
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Denied
                                                           type:ECPrivacyType_Reminders];
                                          NSLog(@"erro:%@",error);
                                      }
                                      if (granted) {
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Authorized
                                                           type:ECPrivacyType_Reminders];

                                      }else{
                                          [self executeCallBack:accessStatusCallBack
                                                   accessStatus:ECAuthorizationStatus_Denied
                                                           type:ECPrivacyType_Reminders];
                                      }
                                  }];
        }
    } else if (status == EKAuthorizationStatusRestricted) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Restricted
                         type:ECPrivacyType_Reminders];
    } else if (status == EKAuthorizationStatusDenied) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Denied
                         type:ECPrivacyType_Reminders];
    } else {
        // EKAuthorizationStatusAuthorized
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Authorized
                         type:ECPrivacyType_Reminders];
    }
}

#pragma mark -------------------- Photos --------------------
+ (void)checkAndRequestAccessForPhotosWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusNotDetermined) {
            //                [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Photos];
            @weakify(self)
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                @strongify(self)
                if (status == PHAuthorizationStatusNotDetermined) {
                    [self executeCallBack:accessStatusCallBack
                             accessStatus:ECAuthorizationStatus_NotDetermined
                                     type:ECPrivacyType_Photos];
                } else if (status == PHAuthorizationStatusRestricted) {
                    [self executeCallBack:accessStatusCallBack
                             accessStatus:ECAuthorizationStatus_Restricted
                                     type:ECPrivacyType_Photos];
                } else if (status == PHAuthorizationStatusDenied) {
                    [self executeCallBack:accessStatusCallBack
                             accessStatus:ECAuthorizationStatus_Denied
                                     type:ECPrivacyType_Photos];
                } else {
                    // PHAuthorizationStatusAuthorized
                    [self executeCallBack:accessStatusCallBack
                             accessStatus:ECAuthorizationStatus_Authorized
                                     type:ECPrivacyType_Photos];
                }
            }];
        } else if (status == PHAuthorizationStatusRestricted) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Restricted
                             type:ECPrivacyType_Photos];
        } else if (status == PHAuthorizationStatusDenied) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Denied
                             type:ECPrivacyType_Photos];
        } else {
            // PHAuthorizationStatusAuthorized
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Authorized
                             type:ECPrivacyType_Photos];
        }
    } else {
        NSLog(@"相册不可用！");
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_NotSupport
                         type:ECPrivacyType_Photos];
    }
}

#pragma mark -------------------- BluetoothSharing --------------------
- (void)checkAndRequestAccessForBluetoothSharingWithAccessStatus:(AccessForBluetoothResultBlock)accessStatusCallBack{
    self.cMgr = [[CBCentralManager alloc] initWithDelegate:self
                                                     queue:nil];
    if (@available(iOS 10.0, *)) {
        [self setCBManagerStateCallBackBlock:^(CBManagerState status){
            if (status == CBManagerStateResetting) {
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusResetting
                                                                       type:ECPrivacyType_BluetoothSharing];
            } else if (status == CBManagerStateUnsupported) {
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusUnsupported
                                                                       type:ECPrivacyType_BluetoothSharing];
            } else if (status == CBManagerStateUnauthorized) {
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusUnauthorized
                                                                       type:ECPrivacyType_BluetoothSharing];
            } else if (status == CBManagerStatePoweredOff) {
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusPoweredOff
                                                                       type:ECPrivacyType_BluetoothSharing];
            } else if (status == CBManagerStatePoweredOn) {
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusPoweredOn
                                                                       type:ECPrivacyType_BluetoothSharing];
            } else {
                // CBManagerStateUnknown
                [ECAuthorizationTools executeCallBackForForBluetoothSharing:accessStatusCallBack
                                                               accessStatus:ECCBManagerStatusUnknown
                                                                       type:ECPrivacyType_BluetoothSharing];
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}
#pragma mark - CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    if (self.CBManagerStateCallBackBlock) {
        self.CBManagerStateCallBackBlock(central.state);
    }
}
#pragma mark -------------------- Microphone --------------------
+ (void)checkAndRequestAccessForMicrophoneWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusNotDetermined) {
//        [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Microphone];
        @weakify(self)
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            @strongify(self)
            if (granted) {
                [self executeCallBack:accessStatusCallBack
                         accessStatus:ECAuthorizationStatus_Authorized
                                 type:ECPrivacyType_Microphone];
            }else{
                [self executeCallBack:accessStatusCallBack
                         accessStatus:ECAuthorizationStatus_Denied
                                 type:ECPrivacyType_Microphone];
            }
        }];
    } else if (status == AVAuthorizationStatusRestricted) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Restricted
                         type:ECPrivacyType_Microphone];
    } else if (status == AVAuthorizationStatusDenied) {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Denied
                         type:ECPrivacyType_Microphone];
    } else {
        // AVAuthorizationStatusAuthorized
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_Authorized
                         type:ECPrivacyType_Microphone];
    }
}
#pragma mark -------------------- SpeechRecognition --------------------
+ (void)checkAndRequestAccessForSpeechRecognitionWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
        if (@available(iOS 10.0, *)) {
            SFSpeechRecognizerAuthorizationStatus status = [SFSpeechRecognizer authorizationStatus];
            if (status == SFSpeechRecognizerAuthorizationStatusNotDetermined) {
                //            [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_SpeechRecognition];
                @weakify(self)
                [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
                    @strongify(self)
                    if (status == SFSpeechRecognizerAuthorizationStatusNotDetermined) {
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_NotDetermined
                                         type:ECPrivacyType_SpeechRecognition];
                    } else if (status == SFSpeechRecognizerAuthorizationStatusDenied) {
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Denied
                                         type:ECPrivacyType_SpeechRecognition];
                    } else if (status == SFSpeechRecognizerAuthorizationStatusRestricted) {
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Restricted
                                         type:ECPrivacyType_SpeechRecognition];
                    } else {
                        // SFSpeechRecognizerAuthorizationStatusAuthorized
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Authorized
                                         type:ECPrivacyType_SpeechRecognition];
                    }
                }];
            } else if (status == SFSpeechRecognizerAuthorizationStatusDenied) {
                [self executeCallBack:accessStatusCallBack
                         accessStatus:ECAuthorizationStatus_Denied
                                 type:ECPrivacyType_SpeechRecognition];
            } else if (status == SFSpeechRecognizerAuthorizationStatusRestricted) {
                [self executeCallBack:accessStatusCallBack
                         accessStatus:ECAuthorizationStatus_Restricted
                                 type:ECPrivacyType_SpeechRecognition];
            } else {
                // SFSpeechRecognizerAuthorizationStatusAuthorized
                [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_Authorized
                                 type:ECPrivacyType_SpeechRecognition];
            }
        } else {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_NotSupport
                             type:ECPrivacyType_SpeechRecognition];
        }
}
#pragma mark -------------------- Camera --------------------
+ (void)checkAndRequestAccessForCameraWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
//            [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Camera];
            @weakify(self)
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                                     completionHandler:^(BOOL granted) {
                                         @strongify(self)
                                         if (granted) {
                                             [self executeCallBack:accessStatusCallBack
                                                        accessStatus:ECAuthorizationStatus_Authorized
                                                              type:ECPrivacyType_Camera];
                                         }else{
                                             [self executeCallBack:accessStatusCallBack
                                                      accessStatus:ECAuthorizationStatus_Denied
                                                              type:ECPrivacyType_Camera];
                                         }
                                     }];
        } else if (status == AVAuthorizationStatusRestricted) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Restricted
                             type:ECPrivacyType_Camera];
        } else if (status == AVAuthorizationStatusDenied) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Denied
                             type:ECPrivacyType_Camera];
        } else {
            // AVAuthorizationStatusAuthorized
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Authorized
                             type:ECPrivacyType_Camera];
        }
    }else{
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_NotSupport
                         type:ECPrivacyType_Camera];
    }
}
#pragma mark -------------------- Health --------------------
- (void)checkAndRequestAccessForHealthWtihAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
     if (@available(iOS 8.0, *)) {
         if ([HKHealthStore isHealthDataAvailable]) {
             // 以心率 HKQuantityTypeIdentifierHeartRate 为例子
             HKQuantityType *heartRateType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
             HKAuthorizationStatus status = [self.healthStore authorizationStatusForType:heartRateType];
             if (status == HKAuthorizationStatusNotDetermined) {
                 //                [ECAuthorizationTools executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_Health];
                 NSSet *typeSet = [NSSet setWithObject:heartRateType];
                 [self.healthStore requestAuthorizationToShareTypes:typeSet
                                                          readTypes:typeSet
                                                         completion:^(BOOL success,
                                                                      NSError * _Nullable error) {
                                                             // tips：这个block不止在用户点击允许或者不允许的时候响应，在弹出访问健康数据允许窗口后，只要界面发生变化（以及程序进入后台），都会响应该block。
                                                             // sucess 为YES代表用户响应了该界面，允许或者拒绝
                                                             if (success) {
                                                                 // 由于用户已经响该界面（不管是允许或者拒绝）
                                                                 // 并且这时候应该只会有两种状态：HKAuthorizationStatusSharingAuthorized 或者 HKAuthorizationStatusSharingDenied
                                                                 HKAuthorizationStatus status = [self.healthStore authorizationStatusForType:heartRateType];
                                                                 if (status == HKAuthorizationStatusNotDetermined) {
                                                                     [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                                                                              accessStatus:ECAuthorizationStatus_NotDetermined
                                                                                                      type:ECPrivacyType_Health];
                                                                 } else if (status == HKAuthorizationStatusSharingAuthorized) {
                                                                     [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                                                                              accessStatus:ECAuthorizationStatus_Authorized
                                                                                                      type:ECPrivacyType_Health];
                                                                 } else {
                                                                     // HKAuthorizationStatusSharingDenied
                                                                     [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                                                                              accessStatus:ECAuthorizationStatus_Denied
                                                                                                      type:ECPrivacyType_Health];
                                                                 }
                                                             }else{
                                                                 if (error) {
                                                                     NSLog(@"requestHealthAuthorization: error:%@",error);
                                                                 }
                                                             }
                                                         }];
             } else if (status == HKAuthorizationStatusSharingAuthorized) {
                 [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                          accessStatus:ECAuthorizationStatus_Authorized
                                                  type:ECPrivacyType_Health];
             } else {
                 // HKAuthorizationStatusSharingDenied
                 [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                          accessStatus:ECAuthorizationStatus_Denied
                                                  type:ECPrivacyType_Health];
             }
         }else{
             [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                      accessStatus:ECAuthorizationStatus_NotSupport
                                              type:ECPrivacyType_Health];
             NSLog(@"unavailable");
             // Health data is not avaliable on all device.
         }
     }else{
         [ECAuthorizationTools executeCallBack:accessStatusCallBack
                                  accessStatus:ECAuthorizationStatus_NotSupport
                                          type:ECPrivacyType_Health];
         NSLog(@"iOS8以下不支持");
     }
}
#pragma mark -------------------- HomeKit --------------------
- (void)checkAndRequestAccessForHome:(AccessForHomeResultBlock)accessForHomeCallBack{
    if (@available(iOS 8.0, *)) {
        self.homeManager.delegate = self;
        [self setHomeAccessCallBackBlock:^(BOOL isHaveAccess){
            if (accessForHomeCallBack) {
                accessForHomeCallBack(isHaveAccess);
            }
        }];
    }else{
        NSLog(@"The home is available on ios8 or later");
    }
}
#pragma mark - HMHomeManagerDelegate
- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager{
    if (manager.homes.count > 0) {
        NSLog(@"A home exists, so we have access.");
        if (self.HomeAccessCallBackBlock) {
            self.HomeAccessCallBackBlock(YES);
        }
    } else {
        @weakify(manager)
        [weak_manager addHomeWithName:@"Test Home"
                     completionHandler:^(HMHome * _Nullable home,
                                         NSError * _Nullable error) {
            if (!error) {
                NSLog(@"We have access for home.");
                if (self.HomeAccessCallBackBlock) {
                    self.HomeAccessCallBackBlock(YES);
                }
            } else {
                // tips：出现错误，错误类型参考 HMError.h
                if (error.code == HMErrorCodeHomeAccessNotAuthorized) {
                    // User denied permission.
                    NSLog(@"用户拒绝!!");
                } else {
                    NSLog(@"HOME_ERROR:%ld,%@",error.code, error.localizedDescription);
                }
                if (self.HomeAccessCallBackBlock) {
                    self.HomeAccessCallBackBlock(YES);
                }
            }
            if (home) {
                
                [weak_manager removeHome:home
                        completionHandler:^(NSError * _Nullable error) {
                    // ... do something with the result of removing the home ...
                }];
            }
        }];
    }
}
#pragma mark -------------------- MediaAndAppleMusic --------------------
+ (void)checkAndRequestAccessForAppleMusicWithAccessStatus:(AccessForTypeResultBlock)accessStatusCallBack{
    if (@available(iOS 9.3, *)) {
        SKCloudServiceAuthorizationStatus status = [SKCloudServiceController authorizationStatus];
        if (status == SKCloudServiceAuthorizationStatusNotDetermined) {
            //            [self executeCallBack:accessStatusCallBack accessStatus:ECAuthorizationStatus_NotDetermined type:ECPrivacyType_MediaAndAppleMusic];
            @weakify(self)
            [SKCloudServiceController requestAuthorization:^(SKCloudServiceAuthorizationStatus status) {
                @strongify(self)
                switch (status) {
                    case SKCloudServiceAuthorizationStatusNotDetermined:{
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_NotDetermined
                                         type:ECPrivacyType_MediaAndAppleMusic];
                    }
                        break;
                    case SKCloudServiceAuthorizationStatusRestricted:{
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Restricted
                                         type:ECPrivacyType_MediaAndAppleMusic];
                    }
                        break;
                    case SKCloudServiceAuthorizationStatusDenied:{
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Denied
                                         type:ECPrivacyType_MediaAndAppleMusic];
                    }
                        break;
                    case SKCloudServiceAuthorizationStatusAuthorized:{
                        [self executeCallBack:accessStatusCallBack
                                 accessStatus:ECAuthorizationStatus_Authorized
                                         type:ECPrivacyType_MediaAndAppleMusic];
                    }
                        break;
                    default:
                        break;
                }
            }];
        } else if (status == SKCloudServiceAuthorizationStatusRestricted) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Restricted
                             type:ECPrivacyType_MediaAndAppleMusic];
        } else if (status == SKCloudServiceAuthorizationStatusDenied) {
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Denied
                             type:ECPrivacyType_MediaAndAppleMusic];
        } else{
            // SKCloudServiceAuthorizationStatusAuthorized
            [self executeCallBack:accessStatusCallBack
                     accessStatus:ECAuthorizationStatus_Authorized
                             type:ECPrivacyType_MediaAndAppleMusic];
        }
    } else {
        [self executeCallBack:accessStatusCallBack
                 accessStatus:ECAuthorizationStatus_NotSupport
                         type:ECPrivacyType_MediaAndAppleMusic];
        NSLog(@"AppleMusic只支持iOS9.3+");
    }
}

#pragma mark -------------------- MotionAndFitness --------------------
- (void)checkAndRequestAccessForMotionAndFitness{
    @weakify(self)
    [self.cmManager startActivityUpdatesToQueue:self.motionActivityQueue
                                    withHandler:^(CMMotionActivity *activity) {
                                        // Do something with the activity reported.
                                        @strongify(self)
                                        [self.cmManager stopActivityUpdates];
                                        NSLog(@"We have access for MotionAndFitness.");
                                    }];
    NSLog(@"We don't have permission to MotionAndFitness.");
}
#pragma mark -------------------- accessStatus callbacks --------------------
// all CallBack
+ (void)executeCallBack:(AccessForTypeResultBlock)accessStatusCallBack
           accessStatus:(ECAuthorizationStatus)accessStatus
                   type:(ECPrivacyType)type{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (accessStatusCallBack) {
            accessStatusCallBack(accessStatus, type); NSLog(@"\n//************************************************************//\n获取权限类型：%@\n权限状态：%@\n//************************************************************//\n",[ECAuthorizationTools stringForPrivacyType:type], [ECAuthorizationTools stringForAuthorizationStatus:accessStatus]);
        }
    });
}
// Location Services CallBack
+ (void)executeCallBackForForLocationServices:(AccessForLocationResultBlock)accessStatusCallBack
                                 accessStatus:(ECLocationAuthorizationStatus)accessStatus
                                         type:(ECPrivacyType)type{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (accessStatusCallBack) {
            accessStatusCallBack(accessStatus); NSLog(@"\n//************************************************************//\n获取权限类型：%@\n权限状态：%@\n//************************************************************//\n",[ECAuthorizationTools stringForPrivacyType:type], [ECAuthorizationTools stringForLocationAuthorizationStatus:accessStatus]);
        }
    });
}
// Bluetooth Sharing CallBack
+ (void)executeCallBackForForBluetoothSharing:(AccessForBluetoothResultBlock)accessStatusCallBack
                                 accessStatus:(ECCBManagerStatus)accessStatus
                                         type:(ECPrivacyType)type{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (accessStatusCallBack) {
            accessStatusCallBack(accessStatus);
        }
    });
}
#pragma mark -------------------- Public Methods --------------------
+ (NSString *)stringForPrivacyType:(ECPrivacyType)privacyType{
    if (privacyType == ECPrivacyType_LocationServices) {
        return @"LocationServices";
    }else if (privacyType == ECPrivacyType_Contacts) {
        return @"Contacts";
    }else if (privacyType == ECPrivacyType_Calendars) {
        return @"Calendars";
    }else if (privacyType == ECPrivacyType_Reminders) {
        return @"Reminders";
    }else if (privacyType == ECPrivacyType_Photos) {
        return @"Photos";
    }else if (privacyType == ECPrivacyType_BluetoothSharing) {
        return @"BluetoothSharing";
    }else if (privacyType == ECPrivacyType_Microphone) {
        return @"Microphone";
    }else if (privacyType == ECPrivacyType_SpeechRecognition) {
        return @"SpeechRecognition";
    }else if (privacyType == ECPrivacyType_Camera) {
        return @"Camera";
    }else if (privacyType == ECPrivacyType_Health) {
        return @"Health";
    }else if (privacyType == ECPrivacyType_HomeKit) {
        return @"Home";
    }else if (privacyType == ECPrivacyType_MediaAndAppleMusic) {
        return @"Media And AppleMusic";
    }else if (privacyType == ECPrivacyType_MotionAndFitness) {
        return @"Motion And Fitness";
    }else return @"";
}
+ (NSString *)stringForAuthorizationStatus:(ECAuthorizationStatus)authorizationStatus{
    if (authorizationStatus == ECAuthorizationStatus_Authorized) {
        return @"Authorized";
    }else if (authorizationStatus == ECAuthorizationStatus_Denied) {
        return @"Denied";
    }else if (authorizationStatus == ECAuthorizationStatus_Restricted) {
        return @"Restricted";
    }else if (authorizationStatus == ECAuthorizationStatus_NotSupport) {
        return @"NotSupport";
    }else return @"NotDetermined";
}
+ (NSString *)stringForLocationAuthorizationStatus:(ECLocationAuthorizationStatus)locationAuthorizationStatus{
    if (locationAuthorizationStatus == ECLocationAuthorizationStatus_Authorized) {
        return @"Location Authorized, < ios8";
    }else if (locationAuthorizationStatus == ECLocationAuthorizationStatus_Denied) {
        return @"Location Denied";
    }else if (locationAuthorizationStatus == ECLocationAuthorizationStatus_Restricted) {
        return @"Location Restricted";
    }else if (locationAuthorizationStatus == ECLocationAuthorizationStatus_NotSupport) {
        return @"Location NotSupport";
    }else if (locationAuthorizationStatus == ECLocationAuthorizationStatus_AuthorizedAlways) {
        return @"Location AuthorizedAlways";
    }else if (locationAuthorizationStatus == ECLocationAuthorizationStatus_AuthorizedWhenInUse) {
        return @"Location AuthorizedWhenInUse";
    }else return @"Location NotDetermined";
}
+ (NSString *)stringForCBManagerStatus:(ECCBManagerStatus)CBManagerStatus;{
    if (CBManagerStatus == ECCBManagerStatusResetting) {
        return @"Bluetooth Resetting";
    }else if (CBManagerStatus == ECCBManagerStatusUnsupported) {
        return @"Bluetooth Unsupported";
    }else if (CBManagerStatus == ECCBManagerStatusUnauthorized) {
        return @"Bluetooth Unauthorized";
    }else if (CBManagerStatus == ECCBManagerStatusPoweredOff) {
        return @"Bluetooth PoweredOff";
    }else if (CBManagerStatus == ECCBManagerStatusPoweredOn) {
        return @"Bluetooth PoweredOn";
    }else return @"Bluetooth Unknown";
}
#pragma mark —— lazyLoad
-(CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = CLLocationManager.new;
        _locationManager.delegate = self;
    }return _locationManager;
}

-(HKHealthStore *)healthStore{
    if (!_healthStore) {
        _healthStore = HKHealthStore.new;
    }return _healthStore;
}

-(CMMotionActivityManager *)cmManager{
    if (!_cmManager) {
        _cmManager = CMMotionActivityManager.new;
    }return _cmManager;
}

-(NSOperationQueue *)motionActivityQueue{
    if (!_motionActivityQueue) {
        _motionActivityQueue = NSOperationQueue.new;
    }return _motionActivityQueue;
}

-(HMHomeManager *)homeManager{
    if (!_homeManager) {
        _homeManager = HMHomeManager.new;
    }return _homeManager;
}

@end








