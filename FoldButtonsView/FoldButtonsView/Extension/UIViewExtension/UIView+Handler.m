//
//  UIView+Handler.m
//  AttributedString
//
//  Created by 李鹏跃 on 2018/9/11.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "UIView+Handler.h"
#import <objc/runtime.h>

static NSString *const k_layoutConstraintAxisNumber = @"k_layoutConstraintAxisNumber";
static NSString *const k_layoutPriorityNumber = @"k_layoutPriority";

@interface UIView (Handler)
@property (nonatomic,assign) NSNumber *layoutConstraintAxisNumber;
@property (nonatomic,assign) NSNumber *layoutPriorityNumber;
@end

@implementation UIView (Handler)

- (UIView *(^)(CGFloat)) setUpCornerRadius {
    __weak typeof (self) weakSelf = self;
    return ^(CGFloat radius) {
        weakSelf.layer.cornerRadius = radius;
        return weakSelf;
    };
}
- (UIView *(^)(BOOL)) setUpMasksToBounds {
    __weak typeof (self) weakSelf = self;
    return ^(BOOL masksToBounds) {
        weakSelf.layer.masksToBounds = masksToBounds;
        return weakSelf;
    };
}

- (UIView *(^)(CGFloat)) setUpBorderWidth {
    __weak typeof (self) weakSelf = self;
    return ^(CGFloat borderWidth) {
        weakSelf.layer.borderWidth = borderWidth;
        return weakSelf;
    };
}
- (UIView *(^)(UIColor *)) setUpBorderColor {
    __weak typeof (self) weakSelf = self;
    return ^(UIColor *borderColor) {
        weakSelf.layer.borderColor = borderColor.CGColor;
        return weakSelf;
    };
}

- (UIView *(^)(UIColor *)) setUpBackgroundColor {
    __weak typeof (self) weakSelf = self;
    return ^(UIColor *backgroundColor) {
        weakSelf.backgroundColor = backgroundColor;
        return weakSelf;
    };
}

- (UIView *(^)(UILayoutConstraintAxis))setUpUILayoutConstraintAxis {
    return ^(UILayoutConstraintAxis axis) {
        self.layoutConstraintAxisNumber = @(axis);
        [self setupLayoutPriority];
        return self;
    };
}
- (UIView *(^)(UILayoutPriority))setUpUILayoutPriority {
    return ^(UILayoutPriority priority) {
        self.layoutPriorityNumber = @(priority);
        [self setupLayoutPriority];
        return self;
    };
}

- (void) setupLayoutPriority {
    if (self.layoutPriorityNumber && self.layoutConstraintAxisNumber) {
        [self setContentCompressionResistancePriority:self.layoutPriorityNumber.integerValue forAxis:self.layoutConstraintAxisNumber.integerValue];
    }
}

- (NSNumber *)layoutConstraintAxisNumber {
    return objc_getAssociatedObject(self, &k_layoutConstraintAxisNumber);
}
- (void)setLayoutConstraintAxisNumber:(NSNumber *)layoutConstraintAxisNumber {
    objc_setAssociatedObject(self, &k_layoutConstraintAxisNumber, layoutConstraintAxisNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)layoutPriorityNumber {
    return objc_getAssociatedObject(self, &k_layoutPriorityNumber);
}
- (void)setLayoutPriorityNumber:(NSNumber *)layoutPriorityNumber {
    objc_setAssociatedObject(self, &k_layoutPriorityNumber, layoutPriorityNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
