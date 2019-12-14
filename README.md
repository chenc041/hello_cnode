# hello_cnode

A cnode client written by flutter

### 作者: [@chenc](https://github.com/cWatermelon)

## 开始使用

### 生成model 文件

```sh
flutter packages pub run build_runner build

```

### 已实现功能
- 首页, 精华, 分享, 问答, 招聘 等板块
- 查看帖子
- 收藏帖子
- 个人中心
- 扫码登录
- web_view跳转git仓库地址

### 未实现功能
####
> cnode 已经将回复点赞接口下线~~~
- 创建/回复
- 回复点赞

### 缺点
 > 富文本没有很好的办法展示, 所有回复的帖子如果包含图片的话, 是没法展示的... 这个好像没有很好的办法解决....
 

### 依赖
- [dio](https://pub.flutter-io.cn/packages/dio) 网络请求库
- [date_format](https://pub.flutter-io.cn/packages/date_format) 时间格式化
- [webview_flutter](https://pub.flutter-io.cn/packages/webview_flutter) web_view
- [shared_preferences](https://pub.flutter-io.cn/packages/shared_preferences) 简单的数据缓存
- [qrscan](https://pub.flutter-io.cn/packages/qrscan) 安卓扫码
- [package_info](https://pub.flutter-io.cn/packages/package_info) APK包信息

### 真机示例

![demo pic](./example/example.gif)
