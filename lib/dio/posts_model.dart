import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class Posts{
  @JsonKey(name: 'userId')
 int? userId;

  @JsonKey(name: 'id')
 int? postId;

   @JsonKey(name: 'title')
 String? postTitle;

   @JsonKey(name: 'body')
 String? postBody;

 Posts(this.postBody,this.postId,this.postTitle,this.userId);

 factory Posts.fromJson(Map<String,dynamic> json) => _$PostsFromJson(json);
 Map<String,dynamic> toJson()=> _$PostsToJson(this);

}