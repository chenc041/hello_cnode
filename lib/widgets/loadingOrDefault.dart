import 'package:flutter/material.dart';
import 'package:hello_cnode/constants/index.dart';

Widget loading() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: Colors.grey[200],
    valueColor: AlwaysStoppedAnimation(Colors.blue),
  ));
}

Widget notFound() {
  return Center(
    child: Image.asset(NOT_FOUND, width: 100, fit: BoxFit.fitWidth),
  );
}

Widget empty() {
  return Center(
    child: Image.asset(EMPTY, width: 100, fit: BoxFit.fitWidth),
  );
}

Widget defaultContent(Widget child) {
  return child;
}