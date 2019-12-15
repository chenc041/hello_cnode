import 'package:flutter/material.dart';
import 'package:hello_cnode/constants/index.dart';

Widget loading() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: Colors.grey[200],
    valueColor: AlwaysStoppedAnimation(Colors.blue),
  ));
}

Widget notFound([callback]) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Image.asset(NOT_FOUND, width: 100, fit: BoxFit.fitWidth),
          InkWell(
            onTap: () {
              if (callback != null) {
                callback();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('点击重新加载', style: TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    ),
  );
}

Widget empty([callback]) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Image.asset(EMPTY, width: 100, fit: BoxFit.fitWidth),
          InkWell(
            onTap: () {
              if (callback!= null) {
                callback();
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('点击重新加载', style: TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
    )
  );
}

Widget defaultContent(Widget child) {
  return child;
}
