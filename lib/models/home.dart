import 'package:json_annotation/json_annotation.dart';
import 'author.dart';
part 'home.g.dart';

@JsonSerializable(explicitToJson: true)
class Home {
  Home(
    this.author,
    this.authorId,
    this.content,
    this.createAt,
    this.good,
    this.id,
    this.lastReplyAt,
    this.replyCount,
    this.tab,
    this.title,
    this.top,
    this.visitCount,
  );

  Author author;

  @JsonKey(name: 'author_id')
  String authorId;

  String content;

  @JsonKey(name: 'create_at')
  DateTime createAt;

  bool good;

  String id;

  @JsonKey(name: 'last_reply_at')
  DateTime lastReplyAt;

  @JsonKey(name: 'reply_count')
  int replyCount;

  String tab;

  String title;

  bool top;

  @JsonKey(name: 'visit_count')
  int visitCount;

  //不同的类使用不同的mixin即可
  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}
