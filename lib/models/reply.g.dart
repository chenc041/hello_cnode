// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) {
  return Reply(
    json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    json['content'] as String,
    json['create_at'] == null
        ? null
        : DateTime.parse(json['create_at'] as String),
    json['id'] as String,
    json['is_uped'] as bool,
    (json['ups'] as List)?.map((e) => e as String)?.toList(),
  )..replyId = json['reply_id'] as String;
}

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'create_at': instance.createAt?.toIso8601String(),
      'id': instance.id,
      'is_uped': instance.isUped,
      'reply_id': instance.replyId,
      'ups': instance.ups,
    };
