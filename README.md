# Android模板
此模板主要用于项目开始创建，架构方式使用的是MVP设计模式，主要原因使用mvp需要创建的类太多，所以这里使用了模板

使用方式

    将下载的模板覆盖studio的模板
    模板的位置   studio的位置/Contents/plugins/android/lib/templates
    覆盖gradle-projects下的NewAndroidProject和NewAndroidMoudle
    将MVPActivity拷贝至activies文件夹下
    将MVPFragment拷贝至others文件夹下



分包的原则使用的是功能分包

```
1. base包下主要放置一些基础类
2. bean包下放置实体类
3. config下放置配置文件，主要是URL的配置文件，图片的配置文件，缓存的配置文件等等
4. db包下放置跟数据库操作相关的类
5. http包下放置网络连接的操作类，RetrofitApiService中放置网络连接的接口，这里的返回值建议返回Observable对象。HttpHelper主要实现网络连接的具体方法。
6. image包下放置显示图片的具体方法，因为glide和fresco加载的方式不一样，这里生成一个管理类ImageHelper。这里默认是Glide加载方式
7. ui包下放置显示的Activity和Fragment
8. utils包下放置所有的工具类
9. widget包下放置自定的控件
10. App类是整个应用程序的初始化类
 
```


 