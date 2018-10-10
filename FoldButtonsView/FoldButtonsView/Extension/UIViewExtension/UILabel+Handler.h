//
//  +Handler.h
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/8.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Handler)

/**
 * @brief  NSString 设置 text
 * @warning 参数类型：NSString
 */
- (UILabel *(^)(NSString *text)) setUpText;
/**
 * @brief  NSAttributedString 设置 text
 * @warning 参数类型：NSString
 */
- (UILabel *(^)(NSAttributedString *text)) setUpAttributedText;

/**
 * @brief NSTextAlignment textAlignment
 * @warning 参数类型：NSTextAlignment
 */
- (UILabel *(^)(NSTextAlignment textAlignment))setUpAlignment;

#pragma mark - color

/**
 * @brief UIColor textColor
 * @warning 参数类型：UIColor
 */
- (UILabel *(^)(UIColor *color))setUpTextColor;

/**
 * @brief CGFloat textColor RGBA
 * @warning 参数类型： 四个 CGFloat 值（分别代表r g b a）例如： [UILabel new].setUpTextColorRGBA(255,255,255,0.1);
 */
- (UILabel *(^)(CGFloat r,
                CGFloat g,
                CGFloat b,
                CGFloat a))setUpTextColorRGBA;
/**
 * @brief CGFloat textColor RGB
 * @warning 参数类型： 四个 CGFloat 值（分别代表r g b）例如： [UILabel new].setUpTextColorRGBA(255,255,255);
 */
- (UILabel *(^)(CGFloat r,
                CGFloat g,
                CGFloat b))setUpTextColorRGB;

#pragma mark - font
- (UILabel *(^)(UIFont *font))fontSetUp;

//Futura 字体
- (UILabel *(^)(CGFloat size)) fontFuturaM;

//Ubuntu 字体
- (UILabel *(^)(CGFloat size)) fontUbuntuL;
- (UILabel *(^)(CGFloat size)) fontUbuntuM;
- (UILabel *(^)(CGFloat size)) fontUbuntuB;
- (UILabel *(^)(CGFloat size)) fontUbuntuLightItalic;

// MARK: - 平方字体PingFangSC-Medium
/// CGFloat pingFangSCLightFont
- (UILabel *(^)(CGFloat size)) fontSCL;
/// CGFloat pingFangSCMediumFont
- (UILabel *(^)(CGFloat size)) fontSCM;
/// CGFloat pingFangSCBoldFont
- (UILabel *(^)(CGFloat size)) fontSCB;
/// cgfloat pingfang reguler
- (UILabel *(^)(CGFloat size)) fontSCR;

// MARK: - Didot 字体
///CGFloat didotLightFont
- (UILabel *(^)(CGFloat size)) fontDidotL;
///CGFloat didotMediumFont
- (UILabel *(^)(CGFloat size)) fontDidotM;
///CGFloat didotBoldFont
- (UILabel *(^)(CGFloat size)) fontDidotB;
///CGFloat didotuRegulerFont
- (UILabel *(^)(CGFloat size)) fontDidotR;
///CGFloat robotoCondensedRegulerFont
- (UILabel *(^)(CGFloat size)) robotoCondensedR;
///CGFloat robotoCondensed-Bold
- (UILabel *(^)(CGFloat size)) robotoCondensedB;

- (UILabel *(^)(CGFloat size)) robotoCondensedL;

@end
