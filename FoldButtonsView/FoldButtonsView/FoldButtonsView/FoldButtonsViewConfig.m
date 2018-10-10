//
//  FoldButtonsViewConfig.m
//  FoldButtonsView
//
//  Created by 李鹏跃 on 2018/10/9.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "FoldButtonsViewConfig.h"

@interface FoldButtonsViewConfig()

@end

@implementation FoldButtonsViewConfig

/// 对其方式，
- (FoldButtonsViewConfig *(^)(FoldButtonsViewAligment aligment)) setAligment {
    return ^(FoldButtonsViewAligment aligment) {
        self.aligment = aligment;
        return self;
    };
}

/// 如果 Left_Right 那么第一个button显示完全，后面的会被挡住一些
- (FoldButtonsViewConfig *(^)(FoldButtonsViewDeriction deriction)) setDeriction {
    return ^(FoldButtonsViewDeriction deriction) {
        self.deriction = deriction;
        return self;
    };
}

/// 最多显示多少个button
- (FoldButtonsViewConfig *(^)(NSInteger maxButtonCount)) setMaxButtonCount {
    return ^(NSInteger maxButtonCount) {
        self.maxButtonCount = maxButtonCount;
        return self;
    };
}

/// button 距离self内边距。如果 FoldButtonsViewDerictionLeft_Right，那么将忽略right的值，如果设置了buttonSize，则忽略top值
- (FoldButtonsViewConfig *(^)(UIEdgeInsets edge)) setEdge {
    return ^(UIEdgeInsets edge) {
        self.edge = edge;
        return self;
    };
}

/// button的大小 如果设置了 则edge底部约束生效，size生效。 否则 按照edge布局top bottom 并且button的宽高相等，
- (FoldButtonsViewConfig *(^)(CGSize buttonSize)) setButtonSize {
    return ^(CGSize buttonSize) {
        self.buttonSize = buttonSize;
        return self;
    };
}

/// button之间重叠的距离 越大，覆盖面积越大
- (FoldButtonsViewConfig *(^)(CGFloat foldDistance)) setFoldDistance {
    return ^(CGFloat foldDistance) {
        self.foldDistance = foldDistance;
        return self;
    };
}

- (FoldButtonsViewConfig *(^)(Class customSubButtonClass)) setCustomSubButtonClass {
    return ^(Class clas) {
        self.customSubButtonClass = clas;
        return self;
    };
}
@end
