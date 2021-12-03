//
//  MacroDef_QUEUE.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_QUEUE_h
#define MacroDef_QUEUE_h

#pragma mark ======================================== 队列相关 ==============================================
///异步获取某个队列
#define GET_QUEUE_ASYNC(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}
///获取主队列
#define GET_MAIN_QUEUE_ASYNC(block) GET_QUEUE_ASYNC(dispatch_get_main_queue(), block)
///执行只需运行一次的线程安全代码
#define dispatch_once_t_Func(Selector)\
static dispatch_once_t dispatchOnce;\
dispatch_once(&dispatchOnce, ^{\
    Selector\
});\
///主线程上延迟执行某个事件
#define DispathdDelaySth(Second,Sth)\
dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(Second * NSEC_PER_SEC));\
dispatch_after(delayTime, dispatch_get_main_queue(), ^{\
    Sth;\
});\

#endif /* MacroDef_QUEUE_h */
