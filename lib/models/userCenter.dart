import 'package:hello_cnode/models/userDetail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'userCenter.g.dart';

@JsonSerializable()
class UserCenter {
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  String githubUsername;

  @JsonKey(name: 'loginname')
  String loginName;

  @JsonKey(name: 'recent_replies')
  List<UserDetail> recentReplies;

  @JsonKey(name: 'recent_topics')
  List<UserDetail> recentTopics;

  int score;

  UserCenter(this.avatarUrl, this.githubUsername, this.loginName,
      this.recentReplies, this.recentTopics, this.score);

  factory UserCenter.fromJson(Map<String, dynamic> json) =>
      _$UserCenterFromJson(json);
  Map<String, dynamic> toJson() => _$UserCenterToJson(this);
}
