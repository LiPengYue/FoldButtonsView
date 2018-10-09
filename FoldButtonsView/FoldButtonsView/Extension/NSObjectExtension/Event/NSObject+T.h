//
//  NSObject+T.h
//  PYSegmentView
//
//  Created by 李鹏跃 on 2018/9/10.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (T) <NSObject>
- (void)ifIs: (Class)t do: (void(^)(id obj))block;
- (void)is: (Class)t success: (void(^)(id obj))success;
+ (void)ObjType:(id)obj is: (Class)t success: (void(^)(id obj))success;
@end
