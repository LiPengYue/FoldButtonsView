//
//  +Handler.h
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/8.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Handler)

#pragma mark - color 

- (UILabel *(^)(UIColor *color))setUpTextColor;

/// textColor RGBA
- (UILabel *(^)(CGFloat r,
                CGFloat g,
                CGFloat b,
                CGFloat a))setUpTextColorRGBA;
/// textColor RGB
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
- (UILabel *(^)(CGFloat size))robotoCondensedR;
///CGFloat robotoCondensedRegulerFontBold
- (UILabel *(^)(CGFloat size)) robotoCondensedRB;

@end
