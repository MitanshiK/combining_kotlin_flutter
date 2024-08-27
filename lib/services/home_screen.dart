import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String text="Start service";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("services"),
    ),
    body: Center(
      child: Column(
         children: [
          ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke("setAsForeground");
          }, child: Text("Foreground Services")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke("setAsBackground");
          }, child: Text("Backgound Services")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
              final service=FlutterBackgroundService();
              bool isRunning=await service.isRunning();
              
              if(isRunning){
                service.invoke('stopService');
              }
              else{
                service.startService();
              }

              if(!isRunning){
                text="Stop Service";
              }
              else{
                text="Start Service";
              }
              setState(() { });
          }, child: Text(text))
         ],
    ),),
    );
  }
}