import 'package:flutter/material.dart';
import 'package:hello_cnode/iconFonts/MyIcons.dart';

typedef void Callback(int index);

Widget bottomNavigationBar(
    {Color unselectedColor,
    Color selectedColor,
    int selectedIndex,
    Callback onItemTapped}) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        title: Text(
          '首页',
        ),
        icon: Icon(
          MyIcons.home,
          color: unselectedColor,
        ),
        activeIcon: Icon(
          MyIcons.home,
          color: selectedColor,
        ),
      ),
      BottomNavigationBarItem(
        title: Text(
          '精华',
        ),
        icon: Icon(
          MyIcons.good,
          color: unselectedColor,
        ),
        activeIcon: Icon(
          MyIcons.good,
          color: selectedColor,
        ),
      ),
      BottomNavigationBarItem(
        title: Text(
          '分享',
        ),
        icon: Icon(
          MyIcons.share,
          color: unselectedColor,
        ),
        activeIcon: Icon(
          MyIcons.share,
          color: selectedColor,
        ),
      ),
      BottomNavigationBarItem(
        title: Text(
          '问答',
        ),
        icon: Icon(
          MyIcons.ask,
          color: unselectedColor,
        ),
        activeIcon: Icon(
          MyIcons.ask,
          color: selectedColor,
        ),
      ),
      BottomNavigationBarItem(
        title: Text(
          '招聘',
        ),
        icon: Icon(
          MyIcons.offer,
          color: unselectedColor,
        ),
        activeIcon: Icon(
          MyIcons.offer,
          color: selectedColor,
        ),
      ),
    ],
    iconSize: 24,
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    fixedColor: selectedColor,
    type: BottomNavigationBarType.fixed,
  );
}
