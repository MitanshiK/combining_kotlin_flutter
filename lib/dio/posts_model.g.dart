// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) => Posts(
      json['body'] as String?,
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.postId,
      'title': instance.postTitle,
      'body': instance.postBody,
    };
