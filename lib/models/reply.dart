import 'package:hello_cnode/models/author.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reply.g.dart';

@JsonSerializable()
class Reply {
  Author author;

  String content;

  @JsonKey(name: 'create_at')
  DateTime createAt;

  String id;

  @JsonKey(name: 'is_uped')
  bool isUped;

  @JsonKey(name: 'reply_id')
  String replyId;

  List<String> ups;

  Reply(
      this.author, this.content, this.createAt, this.id, this.isUped, this.ups);

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}
