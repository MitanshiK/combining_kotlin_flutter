import 'package:combining_kotlin_flutter/repository/platform_repository.dart';
import 'package:flutter/material.dart';

class PageToChange extends StatefulWidget {
  const PageToChange({super.key});

  @override
  State<PageToChange> createState() => _PageToChangeState();
}

class _PageToChangeState extends State<PageToChange> {
  String colorResult="0xFFCA2C92";
 
 changeColor(String color)async{
  colorResult= await PlatformRepository().changeColor(color);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title:const Text("Combining Flutter and kotlin code"),),
       body: Container(
        width: MediaQuery.sizeOf(context).width,
        color: Color(int.parse(colorResult)),
        child: Column(
          children: [
          ElevatedButton(onPressed: (){
         setState(() {
           changeColor("0xFF2196F3");
         });
          }, child: Text("blue")
          )
          ,SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            setState(() {
               changeColor("0xFFE65100");
            });
         
          }, child: Text("Orange"))
        ],),),
      ),
    );
  }
}