//
//  JobsUserDefaultDefine.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsUserDefaultDefine_h
#define JobsUserDefaultDefine_h

#ifndef SetUserDefaultKeyWithValue
#define SetUserDefaultKeyWithValue(key,value) [NSUserDefaults.standardUserDefaults setValue:value forKey:key]
#endif

#ifndef SetUserDefaultKeyWithObject
#define SetUserDefaultKeyWithObject(key,object) [NSUserDefaults.standardUserDefaults setObject:object forKey:key]
#endif

#ifndef SetUserBoolKeyWithObject
#define SetUserBoolKeyWithObject(key,object) [NSUserDefaults.standardUserDefaults setBool:object forKey:key]
#endif

#ifndef GetUserDefaultValueForKey
#define GetUserDefaultValueForKey(key) [NSUserDefaults.standardUserDefaults valueForKey:key]
#endif

#ifndef GetUserDefaultObjForKey
#define GetUserDefaultObjForKey(key) [NSUserDefaults.standardUserDefaults objectForKey:key]
#endif

#ifndef GetUserDefaultBoolForKey
#define GetUserDefaultBoolForKey(key) [NSUserDefaults.standardUserDefaults boolForKey:key]
#endif

#ifndef DeleUserDefaultWithKey
#define DeleUserDefaultWithKey(key) [NSUserDefaults.standardUserDefaults removeObjectForKey:key]
#endif

#ifndef UserDefaultSynchronize
#define UserDefaultSynchronize NSUserDefaults.standardUserDefaults.synchronize
#endif

#endif /* JobsUserDefaultDefine_h */
