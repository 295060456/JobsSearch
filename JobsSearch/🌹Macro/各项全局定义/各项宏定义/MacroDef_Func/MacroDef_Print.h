//
//  MacroDef_Print.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Print_h
#define MacroDef_Print_h

#define PrintRetainCount(obj) printf("Retain Count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(obj)));//打印引用计数器

#endif /* MacroDef_Print_h */
