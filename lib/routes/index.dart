import 'package:flutter/material.dart';
import 'package:hello_cnode/pages/home.dart';
import 'package:hello_cnode/pages/detail.dart';
import 'package:hello_cnode/pages/userCenter.dart';
import 'package:hello_cnode/pages/webViewPage.dart';
import 'routeParams.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/detail':
      final ToDetail args = settings.arguments;
      return MaterialPageRoute(builder: (context) => DetailPage(id: args.id));
    case '/userCenter':
      final ToUserCenter args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserProfile(
              loginName: args.userName, avatarUrl: args.userAvatar));
    case '/webview':
      final ToWebView args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => WebViewPage(url: args.url, title: args.title));
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
