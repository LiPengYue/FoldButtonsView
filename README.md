# FoldButtonsView
OC_ 好多叠在一起的 button 封装
![好多叠在一起的 button 呀](https://upload-images.jianshu.io/upload_images/4185621-3dc7a63af56985b8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)

 很简单但是总是遇到这个控件，每次都写感觉好烦，就封装了一个0.0

[代码点这里](https://github.com/LiPengYue/FoldButtonsView)
用到的一些其他代码
`masonry `
[view的链式设置]()
[label属性的链式设置](https://www.jianshu.com/p/e38271c01e15)
[NSMutableAttributedString属性链式处理](https://www.jianshu.com/p/44031cfe2ffc)
[NSString属性链式处理](https://www.jianshu.com/p/3fb565e12198)
[button属性的链式设置](https://www.jianshu.com/p/b7bf7bfb9616)

# 调用
懒加载
```
- (FoldButtonsView *) foldButtonsView {
    if (!_foldButtonsView) {
        _foldButtonsView = [FoldButtonsView new];
        FoldButtonsViewConfig *config = [FoldButtonsViewConfig new];
        
        config
        .setEdge(UIEdgeInsetsMake(10, 10, 10, 10))// 编剧
        .setDeriction(FoldButtonsViewDerictionLeft_Right)//左对齐
        .setAligment(FoldButtonsViewAligment_left)
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
```

修改foldButtonsView内部的button 
```
  [self.foldButtonsView reloadDataToIndex:8 block:^(NSInteger index, UIButton *button) {
            [button setUpStyle:UIControlStateNormal style:^(UIButton *button) {
                button
                .setUpBackgroundImage([UIImage imageNamed:@"".addInt(index)])
                .setUpBackgroundColor(UIColor.whiteColor)
                .setUpTitleColor(UIColor.redColor)
                .setUpBorderWidth(2)
                .setUpBorderColor(UIColor.redColor)
                .setUpFont([UIFont systemFontOfSize:24])
                .setUpMasksToBounds(true)
                .setUpCornerRadius(button.frame.size.width/2.0);
            }];
        }];
```

![ 左对齐，左边第一个按钮在展示完全](https://upload-images.jianshu.io/upload_images/4185621-c951cb0f91ef4755.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)

```
config
        .setDeriction(FoldButtonsViewDerictionLeft_Right)//左对齐
        .setAligment(FoldButtonsViewAligment_left)
```
![左对齐，右边第一个按钮在展示完全](https://upload-images.jianshu.io/upload_images/4185621-63301067e890928e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)
```
 config
        .setDeriction(FoldButtonsViewDerictionRight_Left)//左对齐
        .setAligment(FoldButtonsViewAligment_left)
```

![右对齐，左边第一个按钮在展示完全](https://upload-images.jianshu.io/upload_images/4185621-76027afa89c87b96.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)
```
config
        .setDeriction(FoldButtonsViewDerictionLeft_Right)
         .setAligment(FoldButtonsViewAligment_right)
```


![右对齐，右边第一个按钮在展示完全](https://upload-images.jianshu.io/upload_images/4185621-ec5dd8f2455ef1b8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)

```
config
        .setDeriction(FoldButtonsViewDerictionRight_Left)
        .setAligment(FoldButtonsViewAligment_right)
```

[代码点这里](https://github.com/LiPengYue/FoldButtonsView)
