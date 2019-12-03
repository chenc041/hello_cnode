// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
    json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    json['author_id'] as String,
    json['content'] as String,
    json['create_at'] == null
        ? null
        : DateTime.parse(json['create_at'] as String),
    json['good'] as bool,
    json['id'] as String,
    json['last_reply_at'] == null
        ? null
        : DateTime.parse(json['last_reply_at'] as String),
    json['reply_count'] as int,
    json['tab'] as String,
    json['title'] as String,
    json['top'] as bool,
    json['visit_count'] as int,
  );
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'author': instance.author?.toJson(),
      'author_id': instance.authorId,
      'content': instance.content,
      'create_at': instance.createAt?.toIso8601String(),
      'good': instance.good,
      'id': instance.id,
      'last_reply_at': instance.lastReplyAt?.toIso8601String(),
      'reply_count': instance.replyCount,
      'tab': instance.tab,
      'title': instance.title,
      'top': instance.top,
      'visit_count': instance.visitCount,
    };
