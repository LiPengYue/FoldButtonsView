//
//  UIButton+Handler.h
//  AttributedString
//
//  Created by 李鹏跃 on 2018/9/11.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Handler)

/**
 * @brief 设置state对应的button样式
 *
 * 当调用adjustButtonStyleWithState方法时，button才会改变到相应的样式
 * @warning 注意: 非线程安全，到主线程更新参数
 */
- (void)setUpStyle:(UIControlState) state style:(void(^)(UIButton *button))callBack;

/**
 * @brief 改变通过 setUpStyle:do: 方法设置好的button样式
 *
 * @warning 注意: 如果某个样式没有找到相应state下的值，就会设置成normal状态下的样式 如果normal状态下仍未找到，则保持当前状态
 */
- (void) adjustButtonStyleWithState: (UIControlState) state;

#pragma mark - font
/**
 * @brief 设置normal 状态下的Font
 *
 * @return 返回 一个返回self的block.
 *
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置state对应的font
 */
- (UIButton *(^)(UIFont *)) setUpFont;

- (UIButton *(^)(UIFont *font))fontSetUp;

//Futura 字体
- (UIButton *(^)(CGFloat size)) fontFuturaM;

//Ubuntu 字体
- (UIButton *(^)(CGFloat size)) fontUbuntuL;
- (UIButton *(^)(CGFloat size)) fontUbuntuM;
- (UIButton *(^)(CGFloat size)) fontUbuntuB;
- (UIButton *(^)(CGFloat size)) fontUbuntuLightItalic;

// MARK: - 平方字体PingFangSC-Medium
/// CGFloat pingFangSCLightFont
- (UIButton *(^)(CGFloat size)) fontSCL;
/// CGFloat pingFangSCMediumFont
- (UIButton *(^)(CGFloat size)) fontSCM;
/// CGFloat pingFangSCBoldFont
- (UIButton *(^)(CGFloat size)) fontSCB;
/// cgfloat pingfang reguler
- (UIButton *(^)(CGFloat size)) fontSCR;

// MARK: - Didot 字体
///CGFloat didotLightFont
- (UIButton *(^)(CGFloat size)) fontDidotL;
///CGFloat didotMediumFont
- (UIButton *(^)(CGFloat size)) fontDidotM;
///CGFloat didotBoldFont
- (UIButton *(^)(CGFloat size)) fontDidotB;
///CGFloat didotuRegulerFont
- (UIButton *(^)(CGFloat size)) fontDidotR;
///CGFloat robotoCondensedRegulerFont
- (UIButton *(^)(CGFloat size))robotoCondensedR;
///CGFloat robotoCondensedRegulerFontBold
- (UIButton *(^)(CGFloat size)) robotoCondensedRB;

/**
 * @brief UIColor 设置normal 状态下的titleColor
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置state对应的titleColor
 * @warning 参数类型: UIColor
 */
- (UIButton *(^)(UIColor *)) setUpTitleColor;

/**
 * @brief UIColor 设置normal 状态下的背景色
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置state对应的backgroundColor
 * @warning 参数类型: UIColor
 */
- (UIButton *(^)(UIColor *)) setUpBackgroundColor;

/**
 * @brief NSString 设置normal 状态下的Font
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置state对应的title
 * @warning 参数类型: NSString
 */
- (UIButton *(^)(NSString *)) setUpTitle;

/**
 * @brief NSAttributedString 设置normal 状态下的 AttributedString
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置state对应的AttributedString
 * @warning 参数类型: NSAttributedString
 */
- (UIButton *(^)(NSAttributedString *)) setUpAttributedString;


/**
 * @brief 设置normal 状态下的image
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的image
 * @warning 参数类型: UIImage
 */
- (UIButton *(^)(UIImage *)) setUpImage;
/**
 * @brief NSString 设置normal 状态下的image
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的image
 * @warning 参数类型: NSString
 */
- (UIButton *(^)(NSString *name)) setUpImageName;

/**
 * @brief UIImage 设置normal 状态下的backgroundImage
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的backgroundImage
 * @warning 参数类型: UIImage
 */
- (UIButton *(^)(UIImage *)) setUpBackgroundImage;
/**
 * @brief NSString 设置normal 状态下的backgroundImage
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的backgroundImage
 * @warning 参数类型: NSString
 */
- (UIButton *(^)(NSString *)) setUpBackgroundImageName;
/**
 * @brief CGFloat 设置normal 状态下的layer BorderWidth
 *
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的BorderWidth
 * @warning 参数类型: CGFloat
 */
- (UIButton *(^)(CGFloat)) setUpBorderWidth;

/**
 * @brief UIColor 设置normal 状态下的layer border color
 * @warning 注意: 在 setUpStyle:setUp: 方法中 设置的是对应state的BorderColor
 * @warning 参数类型: UIColor
 */
- (UIButton *(^)(UIColor *)) setUpBorderColor;
@end
