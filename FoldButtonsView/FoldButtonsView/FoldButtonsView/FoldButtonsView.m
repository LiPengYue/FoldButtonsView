//
//  FoldButtonsView.m
//  yiapp
//
//  Created by 李鹏跃 on 2018/10/8.
//  Copyright © 2018年 yi23. All rights reserved.
//

#import "FoldButtonsView.h"
#import "Masonry.h"
@interface FoldButtonsView()
@property (nonatomic,copy) void(^setupButtonWhenCreatingBlock)(NSInteger index, UIButton *button);
@property (nonatomic,strong) NSMutableArray <UIButton *>*buttonArrayM;

@property (nonatomic,assign) FoldButtonsViewAligment aligment;
@property (nonatomic,assign) FoldButtonsViewDeriction deriction;
@property (nonatomic,assign) NSInteger maxButtonCount;
@property (nonatomic,assign) UIEdgeInsets edge;
@property (nonatomic,assign) CGSize buttonSize;
@property (nonatomic,assign) CGFloat foldDistance;
@end

@implementation FoldButtonsView

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


#pragma mark - functions

// MARK: properties get && set
- (NSArray<UIButton *> *)buttonArray {
    return self.buttonArrayM;
}

- (NSMutableArray<UIButton *> *)buttonArrayM {
    if (!_buttonArrayM) {
        _buttonArrayM = [[NSMutableArray alloc]initWithCapacity:self.maxButtonCount];
    }
    return _buttonArrayM;
}

- (void) setConfig:(FoldButtonsViewConfig *)config {
    _config = config;
    self.maxButtonCount = _config.maxButtonCount;
    self.aligment = _config.aligment;
    self.deriction = _config.deriction;
    self.edge = _config.edge;
    self.buttonSize =_config.buttonSize;
    self.foldDistance = _config.foldDistance;
    
    if (self.buttonArrayM.count) {
        __weak typeof(self)weakSelf = self;
        [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [weakSelf relayoutButtonWithIndex:idx
                                     andArray:weakSelf.buttonArrayM
                                    andButton:obj];
        }];
    }
}

- (FoldButtonsView *(^)(FoldButtonsViewConfig *config))setConfig {
    return ^(FoldButtonsViewConfig *config) {
        self.config = config;
        return self;
    };
}

- (void) setMaxButtonCount:(NSInteger)maxButtonCount {
    
    if (_maxButtonCount == maxButtonCount) return;
    
    _maxButtonCount = maxButtonCount;
    [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.buttonArrayM removeAllObjects];
    self.buttonArrayM = [self createAndLayoutButtons];
}

// MAKR: - create and layout buttons
- (NSMutableArray <UIButton *>*) createAndLayoutButtons {
    
    NSMutableArray <UIButton *>* array = [NSMutableArray arrayWithCapacity:self.maxButtonCount];
    
    for (int i = 0; i < self.maxButtonCount; i ++) {
        UIButton *button = [UIButton new];
        [array addObject:button];
        [self addSubview:button];
        if (self.setupButtonWhenCreatingBlock) {
            self.setupButtonWhenCreatingBlock(i, button);
        }
        [self relayoutButtonWithIndex:i
                           andArray:array
                          andButton: button];
        
    }
    return array;
}

- (void) setDeriction:(FoldButtonsViewDeriction)deriction {
    _deriction = deriction;
    switch (self.deriction) {
        case FoldButtonsViewDerictionLeft_Right:
            [self foldButtonsViewDerictionLeft_Right];
            break;
        default:
            [self foldButtonsViewDerictionRight_Left];
            break;
    }
}

- (void) setAligment:(FoldButtonsViewAligment)aligment {
    _aligment = aligment;
    self.edge = self.edge;
}

- (void) foldButtonsViewDerictionRight_Left {
    switch (self.aligment) {
        case FoldButtonsViewAligment_left:{
            __weak typeof(self)weakSelf = self;
            [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf bringSubviewToFront:obj];
            }];
            break;
        }
            
        default:{
            __weak typeof(self)weakSelf = self;
            [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf sendSubviewToBack:obj];
            }];
            break;
        }
    }
}

- (void) foldButtonsViewDerictionLeft_Right {
    
    switch (self.aligment) {
        case FoldButtonsViewAligment_left:{
            __weak typeof(self)weakSelf = self;
            [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf sendSubviewToBack:obj];
            }];
            break;
        }
            
        default:{
            __weak typeof(self)weakSelf = self;
            [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [weakSelf bringSubviewToFront:obj];
            }];
            break;
        }
    }
}


- (void) layoutButtonWithIndex: (NSInteger) index
                      andArray: (NSMutableArray <UIButton *>*)array
                     andButton: (UIButton *)button{
    
    UIView *markView = index <= 0 ? self : array[index - 1];
    if (index <= 0) {
        [self addSubview:button];
    }else{
        [self insertSubview:button belowSubview:markView];
    }
    
    switch (self.aligment) {
        case FoldButtonsViewAligment_left:
            [self layoutButtonLeft_RgithWidthButton:button
                                        andMarkView:markView
                                           andIndex:index];
            break;
        default:
            [self layoutButtonRight_LeftWidthButton:button
                                        andMarkView:markView
                                           andIndex:index];
            break;
    }
}

- (void)layoutButtonLeft_RgithWidthButton: (UIButton *)button
                              andMarkView: (UIView *)markView
                                 andIndex: (NSInteger)index {
    
    CGFloat leftMargin = index <= 0 ? self.edge.left :-self.foldDistance;
    if(self.buttonSize.width && self.buttonSize.height) {
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_left).offset(self.edge.left);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_right).offset(leftMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }
    }else{
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_left).offset(self.edge.left);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_right).offset(leftMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }
    }
}

- (void)layoutButtonRight_LeftWidthButton: (UIButton *)button
                              andMarkView: (UIView *)markView
                                 andIndex: (NSInteger) index{
    
    CGFloat rightMargin = index <= 0 ? self.edge.right : self.foldDistance;
    if(self.buttonSize.width && self.buttonSize.height) {
        if (index == 0) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_right).offset(self.edge.right);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }else{
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_left).offset(rightMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }
    }else{
        if (index == 0) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_right).offset(self.edge.right);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }else{
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_left).offset(rightMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }
    }
}


// MARK: - relayout
- (void) relayoutButtonWithIndex: (NSInteger) index
                        andArray: (NSMutableArray <UIButton *>*)array
                       andButton: (UIButton *)button{
    
    UIView *markView = index <= 0 ? self : array[index - 1];
    
    switch (self.aligment) {
        case FoldButtonsViewAligment_left:
            [self relayoutButtonLeft_RgithWidthButton:button
                                          andMarkView:markView
                                             andIndex: index];
            break;
        default:
            [self relayoutButtonRight_LeftWidthButton:button
                                          andMarkView:markView
                                             andIndex:index];
            break;
    }
}

- (void)relayoutButtonLeft_RgithWidthButton: (UIButton *)button
                                andMarkView: (UIView *)markView
                                   andIndex: (NSInteger)index {
    
    CGFloat leftMargin = index <= 0 ? self.edge.left :-self.foldDistance;
    if(self.buttonSize.width && self.buttonSize.height) {
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_left).offset(self.edge.left);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_right).offset(leftMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }
    }else{
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_left).offset(self.edge.left);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(markView.mas_right).offset(leftMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }
    }
}

- (void)relayoutButtonRight_LeftWidthButton: (UIButton *)button
                                andMarkView: (UIView *)markView
                                   andIndex: (NSInteger) index{
    
    CGFloat rightMargin = index <= 0 ? self.edge.right : self.foldDistance;
    if(self.buttonSize.width && self.buttonSize.height) {
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_right).offset(-self.edge.right);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_left).offset(rightMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.width.offset(self.buttonSize.width);
                make.height.offset(self.buttonSize.height);
            }];
        }
    }else{
        if (index == 0) {
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_right).offset(-self.edge.right);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }else{
            [button mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(markView.mas_left).offset(rightMargin);
                make.bottom.equalTo(self).offset(-self.edge.bottom);
                make.top.equalTo(self).offset(self.edge.top);
                make.width.equalTo(button.mas_height);
            }];
        }
    }
}

// MARK: other func
- (void) setupButtonWhenCreatingFunc:(void (^)(NSInteger, UIButton *))block {
    self.setupButtonWhenCreatingBlock = block;
}

- (void) reloadDataToIndex: (NSInteger)endIndex
                     block: (void(^)(NSInteger index, UIButton *button)) block;{
    
    [self.buttonArrayM enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.hidden =  endIndex < idx;
        if (block) {
            block(idx,obj);
        }
    }];
}

@end
