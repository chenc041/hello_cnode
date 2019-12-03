// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCenter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCenter _$UserCenterFromJson(Map<String, dynamic> json) {
  return UserCenter(
    json['avatar_url'] as String,
    json['githubUsername'] as String,
    json['loginname'] as String,
    (json['recent_replies'] as List)
        ?.map((e) =>
            e == null ? null : UserDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['recent_topics'] as List)
        ?.map((e) =>
            e == null ? null : UserDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['score'] as int,
  );
}

Map<String, dynamic> _$UserCenterToJson(UserCenter instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'githubUsername': instance.githubUsername,
      'loginname': instance.loginName,
      'recent_replies': instance.recentReplies,
      'recent_topics': instance.recentTopics,
      'score': instance.score,
    };
