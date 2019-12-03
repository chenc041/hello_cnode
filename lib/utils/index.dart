import 'dart:math';
import 'package:hello_cnode/constants/index.dart';

String randomAvatar() {
  List<String> _avatars = [
    DEFAULT_AVATAR,
    DEFAULT_AVATAR_1,
    DEFAULT_AVATAR_2,
    DEFAULT_AVATAR_3,
    DEFAULT_AVATAR_4,
    DEFAULT_AVATAR_5,
    DEFAULT_AVATAR_6,
    DEFAULT_AVATAR_7,
    DEFAULT_AVATAR_8,
    DEFAULT_AVATAR_9,
    DEFAULT_AVATAR_10,
    DEFAULT_AVATAR_11,
    DEFAULT_AVATAR_12,
    DEFAULT_AVATAR_13,
    DEFAULT_AVATAR_14,
    DEFAULT_AVATAR_15,
    DEFAULT_AVATAR_16,
    DEFAULT_AVATAR_17
  ];
  Random _index = Random();
  return _avatars[_index.nextInt(18)];
}
