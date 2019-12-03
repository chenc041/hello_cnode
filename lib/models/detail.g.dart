// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return Detail(
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
    json['is_collect'] as bool,
    json['last_reply_at'] == null
        ? null
        : DateTime.parse(json['last_reply_at'] as String),
    (json['replies'] as List)
        ?.map(
            (e) => e == null ? null : Reply.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['reply_count'] as int,
    json['tab'] as String,
    json['top'] as bool,
    json['title'] as String,
    json['visit_count'] as int,
  );
}

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'author': instance.author,
      'author_id': instance.authorId,
      'content': instance.content,
      'create_at': instance.createAt?.toIso8601String(),
      'good': instance.good,
      'id': instance.id,
      'is_collect': instance.isCollect,
      'last_reply_at': instance.lastReplyAt?.toIso8601String(),
      'replies': instance.replies,
      'reply_count': instance.replyCount,
      'tab': instance.tab,
      'title': instance.title,
      'top': instance.top,
      'visit_count': instance.visitCount,
    };
