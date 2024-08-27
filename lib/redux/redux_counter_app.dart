import 'package:combining_kotlin_flutter/redux/redux_counter_fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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