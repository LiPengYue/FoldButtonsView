//
//  FoldButtonsView.h
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/8.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoldButtonsViewConfig.h"

//https://www.jianshu.com/p/b1f715035adc
/// 多个button叠加在一起的view
@interface FoldButtonsView : UIView

/// 设置config来更新UI
@property (nonatomic,strong) FoldButtonsViewConfig *config;

- (FoldButtonsView *(^)(FoldButtonsViewConfig *config))setConfig;

/// buttons
@property (nonatomic,readonly) NSArray <UIButton *>*buttonArray;

/// button创建的时候会调用，只有在改变maxButtonCount 的时候，才会重新创建button
- (void) setupButtonWhenCreatingFunc: (void(^)(NSInteger index, UIButton *button)) block;

/// 设置button的数据 到index 超过index的button会被隐藏
- (void) reloadDataToIndex: (NSInteger)endIndex
                      block: (void(^)(NSInteger index, UIButton *button)) block;
@end

