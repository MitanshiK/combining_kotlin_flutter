import 'package:combining_kotlin_flutter/custom_paint/draw_circle.dart';
import 'package:combining_kotlin_flutter/dio/dio_screen.dart';
import 'package:combining_kotlin_flutter/page/page_to_change.dart';
import 'package:combining_kotlin_flutter/redux/redux_counter_fun.dart';
import 'package:combining_kotlin_flutter/services/back_services.dart';
import 'package:combining_kotlin_flutter/services/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:redux/redux.dart';

late Store<CounterState> store;
void main() async{

  WidgetsFlutterBinding.ensureInitialized;
await Permission.notification.isDenied.then((value){
if(value){
  Permission.notification.request();
}
});
await initializeService();
  //// redux 
  /* final store=Store<CounterState>(
  counterReducer,        // reducer pure function
  initialState: CounterState.initial()   // initial state
  );*/
  //redux
  runApp(const Home_Screen());        // providerscope for riverPod
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: const MaterialApp(
        home: DrawCircle(),
      ),
    );
  }
}

class ReduxCounter extends StatelessWidget {
  const ReduxCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return  StoreBuilder<CounterState>(
      builder: (BuildContext context, Store<CounterState> vm) { 
      return Scaffold(
        appBar: AppBar(
          title: const Text("redux [StoreBuilder]"),
        ),
        body: Center(
          child:Text(vm.state.counter.toString() ,style: TextStyle(fontSize: 40 ),) ,),
          floatingActionButton: Row(
            children: [
              FloatingActionButton(onPressed: (){
             vm.dispatch(IncrementAction(payload: 1));
              },
              child: Icon(Icons.add),),
              SizedBox(width: 20,),
              FloatingActionButton(onPressed: (){
              vm.dispatch(DecrementAction(payload: 1));
              },
              child: Icon(Icons.remove),)
            ],
          ),
      );
       },
    );
  }
}