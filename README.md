
一款简单的虚拟摇杆（ZMJoystick）
===

大概过程
---

* 两张图片，一张背景图，一张摇杆图片。
* 手指在圆内移动时，摇杆图片跟随手指移动即可。
* 手指移动到圆外，如下图所示，p点手指在屏幕上的坐标，p' 点就是摇杆图片最终坐标。
* 手指离开屏幕，摇杆回到正中心位置。

![mahua](http://upload-images.jianshu.io/upload_images/3239814-e9f74f17461ea452.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

具体实现 （可以结合上下图来看）
----

主要就是  圆参数方程:`x = m + r*cosθ, y = n + r*sinθ ; (m,n)为圆心`

带入具体的数值就OK了.

point：手指当前的坐标； rect：背景图的范围.
![mahua](http://upload-images.jianshu.io/upload_images/3239814-03e2952774a6a89f.png?imageMogr2/auto-orient/strip)

 
![mahua](http://upload-images.jianshu.io/upload_images/3239814-f1330ac5361432bc.gif?imageMogr2/auto-orient/strip
)
效果图.Gif


注意
----
因为坐标系跟我们高中学的有一点点不同，需要稍稍留意一点。

算偏移量的时候都是用的正数，所以要根据象限来判断是需要 “＋” 或者是 “－”。


结束语
----
项目刚开始，还比较简陋，以后有新的功能我会持续更新的。

对项目中如有写的不对或是有不理解的地方欢迎骚扰我。

QQ： 893422739

技术讨论群（PP-iOS学习交流群）：323408051  欢迎萌新加入讨论学习，也欢迎大神指点问题。

ps：我在里面划水！  <群昵称：居然说我昵称太长>


