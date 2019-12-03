// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
    json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    json['id'] as String,
    json['last_reply_at'] == null
        ? null
        : DateTime.parse(json['last_reply_at'] as String),
    json['title'] as String,
  );
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'author': instance.author,
      'id': instance.id,
      'last_reply_at': instance.lastReplyAt?.toIso8601String(),
      'title': instance.title,
    };
