import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author {
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'loginname')
  String loginName;

  Author(this.avatarUrl, this.loginName);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
