import 'package:combining_kotlin_flutter/dio/dio_client.dart';
import 'package:combining_kotlin_flutter/dio/posts_model.dart';
import 'package:flutter/material.dart';

class DioScreen extends StatefulWidget {
  const DioScreen({super.key});

  @override
  State<DioScreen> createState() => _DioScreenState();
}

class _DioScreenState extends State<DioScreen> {
 final DioClient _dioClient=DioClient();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: const Text("getting api data uding dio"),
        ) ,
        body:  Center(
          child: FutureBuilder<Posts?>(
          future: _dioClient.getPost(1),
           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            Posts postData = snapshot.data;
           if(snapshot.hasData) 
          {
            return Column(children: [
           Text(" userid is ${postData.userId}"),
           Text(" userid is ${postData.userId}"),
           Text(" postTitle is ${postData.postTitle}"),
           Text(" postBody is ${postData.postBody}"),

          ],);
          }
          else if(snapshot.hasError){
            return Text("error is ${snapshot.error}");
          }
          else{
           return CircularProgressIndicator();
          }

            },),),
        ),
    );
  }
}