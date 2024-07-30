
import 'package:combining_kotlin_flutter/dio/posts_model.dart';
import 'package:dio/dio.dart';

class DioClient{
final Dio _dio=Dio();

String base_url= "https://jsonplaceholder.typicode.com/posts";

 Future<Posts?> getPost(int postId) async{
  Posts? post;
  try{
 Response response= await _dio.get("$base_url/$postId");
  post=Posts.fromJson(response.data);

  } on DioException catch(e){
      print("exception $e occured");
  }
  return post;
}

}