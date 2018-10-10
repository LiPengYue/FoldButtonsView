//
//  ViewController.m
//  FoldButtonsView
//
//  Created by 李鹏跃 on 2018/10/9.
//  Copyright © 2018年 13lipengyue. All rights reserved.
//

#import "ViewController.h"
#import "FoldButtonsView.h"
#import "UIView+Handler.h"
#import "BaseLabel.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic,strong) FoldButtonsView *foldButtonsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview: self.foldButtonsView];
    
    
    
    [self.foldButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(@80);
        make.height.equalTo(@80);
        make.right.equalTo(self.view).offset(-20);
    }];
    
    [UIView animateWithDuration:0.1 animations:^{
    }completion:^(BOOL finished) {
        [self.foldButtonsView reloadDataToIndex:8 block:^(NSInteger index, UIButton *button) {
            [button setUpStyle:UIControlStateNormal style:^(UIButton *button) {
                button
                .setUpImage([UIImage imageNamed:@"".addInt(index)])
                .setUpBackgroundColor(UIColor.whiteColor)
                .setUpTitleColor(UIColor.whiteColor)
                .setUpBorderWidth(2)
                .setUpBorderColor(UIColor.whiteColor)
                .setUpFont([UIFont systemFontOfSize:24])
                .setUpMasksToBounds(true)
                .setUpCornerRadius(button.frame.size.width/2.0);
            }];
        }];
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.foldButtonsView reloadDataToIndex:8 block:^(NSInteger index, UIButton *button) {
        
        button
        .setUpBackgroundColor(UIColor.whiteColor)
        .setUpTitleColor(UIColor.redColor)
        .setUpTitle(@"".addInt(index))
        .setUpBorderWidth(2)
        .setUpBorderColor(UIColor.redColor)
        .setUpFont([UIFont systemFontOfSize:24])
        .setUpMasksToBounds(true)
        .setUpCornerRadius(button.frame.size.width/2.0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FoldButtonsView *) foldButtonsView {
    if (!_foldButtonsView) {
        _foldButtonsView = [FoldButtonsView new];
        FoldButtonsViewConfig *config = [FoldButtonsViewConfig new];
        
        config
        .setDeriction(FoldButtonsViewDerictionRight_Left)
        .setAligment(FoldButtonsViewAligment_right)
        .setEdge(UIEdgeInsetsMake(10, 10, 10, 10))// 编剧
        .setFoldDistance(20)//button重叠距离
        .setMaxButtonCount(5);
        
        //设置view的基本属性
        _foldButtonsView
        .setConfig(config)
        .setUpBorderColor(UIColor.redColor)
        .setUpBorderWidth(1)
        .setUpBackgroundColor(UIColor.whiteColor);
        
        // button创建的时候会调用，只有在改变maxButtonCount 的时候，才会重新创建button
        [_foldButtonsView setupButtonWhenCreatingFunc:^(NSInteger index, UIButton *button) {
        }];
    }
    return _foldButtonsView;
}

@end
