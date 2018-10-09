//
//  UIButton+Handler.m
//  AttributedString
//
//  Created by 李鹏跃 on 2018/9/11.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "UIButton+Handler.h"
#import <objc/runtime.h>

static NSString *const k_setupState = @"k_setupState";
static NSString *const k_setupBackgroundColorDictionaryM = @"k_setupBackgroundColorDictionaryM";
static NSString *const k_borderColorDictionaryM = @"k_borderColorDictionaryM";
static NSString *const k_borderWidthDictionaryM = @"k_borderWidthDictionaryM";
static NSString *const k_fontDictionaryM = @"k_fontDictionaryM";
static NSString *const k_cornerRadiusDictionaryM = @"k_cornerRadiusDictionaryM";
@interface UIButton (Handler)
@property (nonatomic,assign) UIControlState setupState;

@property (nonatomic,strong) NSMutableDictionary <NSNumber *,UIColor *>*backgroundColorDictionaryM;
@property (nonatomic,strong) NSMutableDictionary <NSNumber *,UIColor *>*borderColorDictionaryM;
@property (nonatomic,strong) NSMutableDictionary <NSNumber *,NSNumber *>*borderWidthDictionaryM;
@property (nonatomic,strong) NSMutableDictionary <NSNumber *,UIFont *>*fontDictionaryM;
@property (nonatomic,strong) NSMutableDictionary <NSNumber *, NSNumber *> *cornerRadiusDictionaryM;
@end

@implementation UIButton (Handler)

- (UIButton *(^)(UIFont *)) setUpFont {
    __weak typeof (self)weakSelf = self;
    return ^(UIFont *font) {
        if (weakSelf.state == weakSelf.setupState) {
            weakSelf.titleLabel.font = font;
        }
        weakSelf.fontDictionaryM[@(weakSelf.setupState)] = font;
        return weakSelf;
    };
}


- (UIButton *(^)(UIFont *font))fontSetUp {
    return ^ (UIFont *font) {
        return self.setUpFont(font);
    };
}

//Futura 字体
//- (UIButton *(^)(CGFloat size)) fontFuturaM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils futuraMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
//
////Ubuntu 字体
//- (UIButton *(^)(CGFloat size)) fontUbuntuL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UIButton *(^)(CGFloat size)) fontUbuntuM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UIButton *(^)(CGFloat size)) fontUbuntuB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UIButton *(^)(CGFloat size)) fontUbuntuLightItalic {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils ubuntuLightItalicFont:size];
//        return self.fontSetUp(font);
//    };
//}
//
//// MARK: - 平方字体PingFangSC-Medium
///// CGFloat pingFangSCLightFont
//- (UIButton *(^)(CGFloat size)) fontSCL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
///// CGFloat pingFangSCMediumFont
//- (UIButton *(^)(CGFloat size)) fontSCM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
///// CGFloat pingFangSCBoldFont
//- (UIButton *(^)(CGFloat size)) fontSCB  {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils pingFangSCBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
//- (UIButton *(^)(CGFloat size)) fontSCR {
//    return ^ (CGFloat size) {
//        UIFont *font = [UIFont systemFontOfSize:size];
//        return self.fontSetUp(font);
//    };
//}
//
//// MARK: - Didot 字体
/////CGFloat didotLightFont
//- (UIButton *(^)(CGFloat size)) fontDidotL {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotLightFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotMediumFont
//- (UIButton *(^)(CGFloat size)) fontDidotM {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotMediumFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotBoldFont
//- (UIButton *(^)(CGFloat size)) fontDidotB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotBoldFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat didotuRegulerFont
//- (UIButton *(^)(CGFloat size)) fontDidotR {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils didotuRegulerFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat robotoCondensedRegulerFont
//- (UIButton *(^)(CGFloat size))robotoCondensedR {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils robotoCondensedRegulerFont:size];
//        return self.fontSetUp(font);
//    };
//}
/////CGFloat robotoCondensedRegulerFontBold
//- (UIButton *(^)(CGFloat size)) robotoCondensedRB {
//    return ^ (CGFloat size) {
//        UIFont *font = [Yi23Utils robotoCondensedRegulerFontBold:size];
//        return self.fontSetUp(font);
//    };
//}


- (UIButton *(^)(CGFloat)) setUpCornerRadius {
    __weak typeof (self) weakSelf = self;
    return ^(CGFloat radius) {
        if (weakSelf.setupState == weakSelf.state) {
            weakSelf.layer.cornerRadius = radius;
        }
        weakSelf.cornerRadiusDictionaryM[@(weakSelf.setupState)] = @(radius);
        return weakSelf;
    };
}

- (void)setUpStyle:(UIControlState) state style:(void(^)(UIButton *button))callBack {
        self.setupState = state;
        callBack(self);
        self.setupState = UIControlStateNormal;
}

- (UIButton *(^)(UIColor *)) setUpTitleColor {
    __weak typeof (self)weakSelf = self;
    return ^(UIColor *color) {
        [weakSelf setTitleColor:color forState:weakSelf.setupState];
        return weakSelf;
    };
}

- (UIButton *(^)(UIColor *)) setUpBackgroundColor {
    __weak typeof (self)weakSelf = self;
    return ^(UIColor *color) {
        weakSelf.backgroundColor = color;
        weakSelf.backgroundColorDictionaryM[@(weakSelf.setupState)] = color;
        return weakSelf;
    };
}

- (UIButton *(^)(NSString *)) setUpTitle {
    __weak typeof (self)weakSelf = self;
    return ^(NSString *title) {
        [weakSelf setTitle:title forState:weakSelf.setupState];
        return weakSelf;
    };
}

- (UIButton *(^)(NSAttributedString *)) setUpAttributedString {
    __weak typeof (self)weakSelf = self;
    return ^(NSAttributedString *attributedString) {
        [weakSelf setAttributedTitle:attributedString forState:weakSelf.setupState];
        return weakSelf;
    };
}

- (UIButton *(^)(UIImage *))setUpImage {
    __weak typeof (self)weakSelf = self;
    return ^(UIImage *image) {
        [weakSelf setImage:image forState:weakSelf.setupState];
        return weakSelf;
    };
}

- (UIButton *(^)(UIImage *))setUpBackgroundImage {
    __weak typeof (self)weakSelf = self;
    return ^(UIImage *image) {
        [weakSelf setBackgroundImage:image forState:weakSelf.setupState];
        return weakSelf;
    };
}

- (UIButton *(^)(CGFloat)) setUpBorderWidth {
    __weak typeof (self)weakSelf = self;
    return ^(CGFloat borderW) {
        if (weakSelf.state == weakSelf.setupState) {
            weakSelf.layer.borderWidth = borderW;
        }
        weakSelf.borderWidthDictionaryM[@(weakSelf.setupState)] = @(borderW);
        return weakSelf;
    };
}

- (UIButton *(^)(UIColor *)) setUpBorderColor {
    __weak typeof (self)weakSelf = self;
    return ^(UIColor *color) {
        if (weakSelf.state == weakSelf.setupState) {
            weakSelf.layer.borderColor = color.CGColor;
        }
        weakSelf.borderColorDictionaryM[@(weakSelf.setupState)] = color;
        return weakSelf;
    };
}

- (void) adjustButtonStyleWithState: (UIControlState) state {
    [self adjustBackgroundColorWithState:state];
    [self adjustBorderColorWithState:state];
    [self adjustBorderWidthWithState:state];
    [self adjustFontWithState:state];
    [self adjustCornerRadiusWithState:state];
}

- (void) adjustBackgroundColorWithState:(UIControlState)state {
    NSNumber *currenState = @(state);
    NSNumber *normalState = @(UIControlStateNormal);
    UIColor *backgroundColor = self.backgroundColorDictionaryM[currenState];
    
    /// backgroundColor
    if (!backgroundColor) {
        backgroundColor = self.backgroundColorDictionaryM[normalState];
    }
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
    
}
- (void) adjustBorderColorWithState:(UIControlState)state {
    NSNumber *currenState = @(state);
    NSNumber *normalState = @(UIControlStateNormal);
    // borderColor
    UIColor *borderColor = self.borderColorDictionaryM[currenState];
    if (!borderColor) {
        borderColor = self.borderColorDictionaryM[normalState];
    }
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
}
- (void) adjustBorderWidthWithState:(UIControlState)state {
    NSNumber *currenState = @(state);
    NSNumber *normalState = @(UIControlStateNormal);
    //borderWidth
    NSNumber *borderWidthNumbser = self.borderWidthDictionaryM[currenState];
    if (!borderWidthNumbser) {
        borderWidthNumbser = self.borderWidthDictionaryM[normalState];
    }
    CGFloat borderWidth = borderWidthNumbser.floatValue;
    self.layer.borderWidth = borderWidth;
}
- (void) adjustFontWithState:(UIControlState)state {
    NSNumber *currenState = @(state);
    NSNumber *normalState = @(UIControlStateNormal);
    //borderWidth
    UIFont *font = self.fontDictionaryM[currenState];
    if (!font) {
        font = self.fontDictionaryM[normalState];
    }
    if (font) {
        self.titleLabel.font = font;
    }
}
- (void) adjustCornerRadiusWithState:(UIControlState)state {
    NSNumber *currenState = @(state);
    NSNumber *normalState = @(UIControlStateNormal);
    //borderWidth
    NSNumber *value = self.cornerRadiusDictionaryM[currenState];
    if (!value) {
        value = self.cornerRadiusDictionaryM[normalState];
    }
    self.layer.cornerRadius = value.floatValue;
}

//MAKR: - get && set
- (void)setSetupState:(UIControlState)setupState {
    objc_setAssociatedObject(self, &k_setupState, @(setupState), OBJC_ASSOCIATION_ASSIGN);
}

- (UIControlState) setupState {
    NSNumber *state = objc_getAssociatedObject(self, &k_setupState);
    return state.integerValue;
}


- (void) setBackgroundColorDictionaryM:(NSMutableDictionary<NSNumber *,UIColor *> *)backgroundColorDictionaryM {
    objc_setAssociatedObject(self, &k_setupBackgroundColorDictionaryM, backgroundColorDictionaryM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary<NSNumber *,UIColor *> *)backgroundColorDictionaryM {
    NSMutableDictionary<NSNumber *,UIColor *> *dic = objc_getAssociatedObject(self, &k_setupBackgroundColorDictionaryM);
    if (!dic) {
        dic = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &k_setupBackgroundColorDictionaryM, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}
- (void) setBorderColorDictionaryM:(NSMutableDictionary<NSNumber *,UIColor *> *)borderColorDictionaryM {
     objc_setAssociatedObject(self, &k_borderColorDictionaryM, borderColorDictionaryM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary<NSNumber *,UIColor *> *)borderColorDictionaryM {
    NSMutableDictionary<NSNumber *,UIColor *> *dic = objc_getAssociatedObject(self, &k_borderColorDictionaryM);
    if (!dic) {
        dic = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &k_borderColorDictionaryM, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

- (void)setBorderWidthDictionaryM:(NSMutableDictionary<NSNumber *,NSNumber *> *)borderWidthDictionaryM {
     objc_setAssociatedObject(self, &k_borderWidthDictionaryM, borderWidthDictionaryM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSMutableDictionary<NSNumber *,NSNumber *> *)borderWidthDictionaryM {
    NSMutableDictionary<NSNumber *,NSNumber *> *dic = objc_getAssociatedObject(self, &k_borderWidthDictionaryM);
    if (!dic) {
        dic = [NSMutableDictionary new];
         objc_setAssociatedObject(self, &k_borderWidthDictionaryM, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

- (void)setFontDictionaryM:(NSMutableDictionary<NSNumber *,UIFont *> *)fontDictionaryM {
    objc_setAssociatedObject(self, &k_fontDictionaryM, fontDictionaryM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary<NSNumber *,UIFont *> *)fontDictionaryM {
    NSMutableDictionary<NSNumber *,UIFont *> *dic = objc_getAssociatedObject(self, &k_fontDictionaryM);
    if (!dic) {
        dic = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &k_fontDictionaryM, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

- (void)setCornerRadiusDictionaryM:(NSMutableDictionary<NSNumber *,NSNumber *> *)cornerRadiusDictionaryM {
    objc_setAssociatedObject(self, &k_cornerRadiusDictionaryM, cornerRadiusDictionaryM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary<NSNumber *,NSNumber *> *)cornerRadiusDictionaryM {
    NSMutableDictionary<NSNumber *,NSNumber *> *dic = objc_getAssociatedObject(self, &k_cornerRadiusDictionaryM);
    if (!dic) {
        dic = [NSMutableDictionary new];
        objc_setAssociatedObject(self, &k_cornerRadiusDictionaryM, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}
@end
