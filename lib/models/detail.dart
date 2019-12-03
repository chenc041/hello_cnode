import 'package:json_annotation/json_annotation.dart';
import 'author.dart';
import 'reply.dart';
part 'detail.g.dart';

@JsonSerializable()
class Detail {
  Detail(
      this.author,
      this.authorId,
      this.content,
      this.createAt,
      this.good,
      this.id,
      this.isCollect,
      this.lastReplyAt,
      this.replies,
      this.replyCount,
      this.tab,
      this.top,
      this.title,
      this.visitCount);

  Author author;

  @JsonKey(name: 'author_id')
  String authorId;

  String content;

  @JsonKey(name: 'create_at')
  DateTime createAt;

  bool good;

  String id;

  @JsonKey(name: 'is_collect')
  bool isCollect;

  @JsonKey(name: 'last_reply_at')
  DateTime lastReplyAt;

  List<Reply> replies;

  @JsonKey(name: 'reply_count')
  int replyCount;

  String tab;

  String title;

  bool top;

  @JsonKey(name: 'visit_count')
  int visitCount;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
