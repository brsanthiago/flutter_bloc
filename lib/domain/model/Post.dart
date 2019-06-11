import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  bool operator ==(other) => other is Post && other.id == id;

  @override
  int get hashCode =>
      super.hashCode ^ userId.hashCode * title.hashCode ^ body.hashCode;
}
