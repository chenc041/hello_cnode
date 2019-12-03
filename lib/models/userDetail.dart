import 'package:hello_cnode/models/author.dart';
import 'package:json_annotation/json_annotation.dart';
part 'userDetail.g.dart';

@JsonSerializable()
class UserDetail {
  Author author;

  String id;

  @JsonKey(name: 'last_reply_at')
  DateTime lastReplyAt;

  String title;

  UserDetail(this.author, this.id, this.lastReplyAt, this.title);

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}
