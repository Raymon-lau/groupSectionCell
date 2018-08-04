# groupSectionCell

![image](https://github.com/Raymon-lau/groupSectionCell/blob/master/111.gif)

1.悬浮的顶部view功能核心代码为主要是这个方法里:

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;

2.把section作为一个整体,实现tableview的分组阴影效果,核心思想只是是把cell的分组效果通过再cell上嵌套tableview实现,可以下面的方法里去实在想要的cell样式

- (void)setCornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity
