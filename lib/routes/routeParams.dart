// 跳转详情路由参数
class ToDetail {
  final String id;
  ToDetail(this.id);
}

class ToUserCenter {
  final String userName;
  final String userAvatar;
  ToUserCenter(this.userName, this.userAvatar);
}

class ToWebView {
  final String url;
  final String title;
  ToWebView(this.url, this.title);
}
