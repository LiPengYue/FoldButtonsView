//
//  NSObject+T.m
//  PYSegmentView
//
//  Created by 李鹏跃 on 2018/9/10.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "NSObject+T.h"

@implementation NSObject (T)
+ (void)ObjType:(id)obj is: (Class)t success: (void(^)(id obj))success {
    [obj is:t success:success];
}
- (void)is: (Class)t success: (void(^)(id obj))success {
    [self ifIs:t do:success];
}
- (void)ifIs: (Class)t do: (void(^)(id obj))block {
    if ([self isKindOfClass:t] && block) {
        block(self);
    }else{
        NSLog(@"   🌶🌶🌶：《%@》 不能转化为 《%@》 类型",NSStringFromClass([self class]),NSStringFromClass(t));
    }
}
@end
