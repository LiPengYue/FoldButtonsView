//
//  FoldButtonsViewConfig.h
//  FoldButtonsView
//
//  Created by 李鹏跃 on 2018/10/9.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /// 从左到右 最左面的为第一个 并显示完全，后面的依次被盖住一些
    FoldButtonsViewDerictionLeft_Right = 0,
    /// 从右到左 最左面的为第一个 并显示完全，后面的依次被盖住一些
    FoldButtonsViewDerictionRight_Left = 1
}FoldButtonsViewDeriction;

typedef enum {
    /// 对其方式 左对齐
    FoldButtonsViewAligment_left = 0,
    /// 对其方式 右对齐
    FoldButtonsViewAligment_right = 1
}FoldButtonsViewAligment;

@interface FoldButtonsViewConfig : NSObject



/// 对其方式，
@property (nonatomic,assign) FoldButtonsViewAligment aligment;
/// 如果 Left_Right 那么第一个button显示完全，后面的会被挡住一些
@property (nonatomic,assign) FoldButtonsViewDeriction deriction;
/// 最多显示多少个button
@property (nonatomic,assign) NSInteger maxButtonCount;
/// button 距离self内边距。如果 FoldButtonsViewDerictionLeft_Right，那么将忽略right的值，如果设置了buttonSize，则忽略top值
@property (nonatomic,assign) UIEdgeInsets edge;
/// button的大小 如果设置了 则edge底部约束生效，size生效。 否则 按照edge布局top bottom 并且button的宽高相等，
@property (nonatomic,assign) CGSize buttonSize;
/// button之间重叠的距离 越大，覆盖面积越大
@property (nonatomic,assign) CGFloat foldDistance;



/// 对其方式，
- (FoldButtonsViewConfig *(^)(FoldButtonsViewAligment aligment)) setAligment;

/// 如果 Left_Right 那么第一个button显示完全，后面的会被挡住一些
- (FoldButtonsViewConfig *(^)(FoldButtonsViewDeriction deriction)) setDeriction;

/// 最多显示多少个button
- (FoldButtonsViewConfig *(^)(NSInteger maxButtonCount)) setMaxButtonCount;

/// button 距离self内边距。如果 FoldButtonsViewDerictionLeft_Right，那么将忽略right的值，如果设置了buttonSize，则忽略top值
- (FoldButtonsViewConfig *(^)(UIEdgeInsets edge)) setEdge;

/// button的大小 如果设置了 则edge底部约束生效，size生效。 否则 按照edge布局top bottom 并且button的宽高相等，
- (FoldButtonsViewConfig *(^)(CGSize buttonSize)) setButtonSize;

/// button之间重叠的距离 越大，覆盖面积越大
- (FoldButtonsViewConfig *(^)(CGFloat foldDistance)) setFoldDistance;
@end
