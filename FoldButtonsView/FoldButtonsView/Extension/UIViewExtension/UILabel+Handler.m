//
//  +Handler.m
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/8.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import "UILabel+Handler.h"

@implementation UILabel(Handler)

- (UILabel *(^)(NSString *text)) setUpText {
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *text)) setUpAttributedText {
    return ^(NSAttributedString *text){
        self.attributedText = text;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment textAlignment))setUpAlignment {
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(CGFloat r,
                CGFloat g,
                CGFloat b,
                CGFloat a))setUpTextColorRGBA {
    return ^(CGFloat r,
             CGFloat g,
             CGFloat b,
             CGFloat a) {
        
        r /= 255.0;
        g /= 255.0;
        b /= 255.0;
        
        UIColor *color = [UIColor colorWithRed:r
                                         green:g
                                          blue:b
                                         alpha:a];
        return self.setUpTextColor(color);
    };
    
}

- (UILabel *(^)(CGFloat r,
                CGFloat g,
                CGFloat b))setUpTextColorRGB {
    return ^(CGFloat r,
             CGFloat g,
             CGFloat b) {
        return self.setUpTextColorRGBA(r,g,b,1);
    };
}

- (UILabel *(^)(UIColor *color))setUpTextColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(UIFont *font))fontSetUp {
    return ^ (UIFont *font) {
        self.font = font;
        return self;
    };
}
//
////Futura 字体
//- (UILabel *(^)(CGFloat size)) fontFuturaM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils futuraMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
//
////Ubuntu 字体
//- (UILabel *(^)(CGFloat size)) fontUbuntuL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UILabel *(^)(CGFloat size)) fontUbuntuM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UILabel *(^)(CGFloat size)) fontUbuntuB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UILabel *(^)(CGFloat size)) fontUbuntuLightItalic {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuLightItalicFont:size];
//        return self.fontSetUp(font);
//    };
//}
//
//// MARK: - 平方字体PingFangSC-Medium
///// CGFloat pingFangSCLightFont
//- (UILabel *(^)(CGFloat size)) fontSCL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
///// CGFloat pingFangSCMediumFont
//- (UILabel *(^)(CGFloat size)) fontSCM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
///// CGFloat pingFangSCBoldFont
//- (UILabel *(^)(CGFloat size)) fontSCB  {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UILabel *(^)(CGFloat size)) fontSCR {
//    return ^ (CGFloat size) {
//        UIFont *font = [UIFont systemFontOfSize:size];
//        return self.fontSetUp(font);
//    };
//}
//
//// MARK: - Didot 字体
/////CGFloat didotLightFont
//- (UILabel *(^)(CGFloat size)) fontDidotL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotMediumFont
//- (UILabel *(^)(CGFloat size)) fontDidotM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotBoldFont
//- (UILabel *(^)(CGFloat size)) fontDidotB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotuRegulerFont
//- (UILabel *(^)(CGFloat size)) fontDidotR {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotuRegulerFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat robotoCondensedRegulerFont
//- (UILabel *(^)(CGFloat size))robotoCondensedR {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils robotoCondensedRegulerFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat robotoCondensedRegulerFontBold
//- (UILabel *(^)(CGFloat size)) robotoCondensedRB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils robotoCondensedRegulerFontBold:size];
//        return self.fontSetUp(font);
//    };
//}

@end
