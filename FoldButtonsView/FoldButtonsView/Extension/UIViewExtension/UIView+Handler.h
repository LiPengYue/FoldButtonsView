//
//  UIView+Handler.h
//  AttributedString
//
//  Created by 李鹏跃 on 2018/9/11.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Handler.h"
#import "UILabel+Handler.h"

@interface UIView (Handler)

/**
 * @brief  CGFloat 圆角大小
 * @warning 参数类型： CGFloat
 */
- (UIView *(^)(CGFloat)) setUpCornerRadius;

/**
 * @brief  BOOL 超出范围是否裁切
 * @warning 参数类型： BOOL
 */
- (UIView *(^)(BOOL)) setUpMasksToBounds;

/**
 * @brief  CGFloat 边框宽度
 * @warning 参数类型： CGFloat
 */
- (UIView *(^)(CGFloat)) setUpBorderWidth;

/**
 * @brief  UIColor 边框颜色
 * @warning 参数类型： UIColor
 */
- (UIView *(^)(UIColor *)) setUpBorderColor;

/**
 * @brief  UIColor 设置背景色
 * @warning 参数类型： UIColor
 */
- (UIView *(^)(UIColor *)) setUpBackgroundColor;


/**
 * @brief UILayoutPriority 设置优先级
 *
 * @warning 优先级越高，那么在父控件无法在无越界的情况下的情况下，就会优先先把优先级高的控件显示完整，然后再依次显示优先级低的
 * @warning 参数类型： UILayoutPriority
 */
- (UIView *(^)(UILayoutPriority priority)) setUpUILayoutPriority;


/**
 * @brief UILayoutPriority 优先级 轴线
 *
 * @warning 横向还是纵向进行优先级限制
 * @warning 参数类型： UILayoutConstraintAxis
 */
- (UIView *(^)(UILayoutConstraintAxis constraint)) setUpUILayoutConstraintAxis;
@end
