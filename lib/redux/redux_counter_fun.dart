// state
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterState {
  // Appstate class
  final int counter; // final variable to make it immmutable

  const CounterState(
      { // constructor
      required this.counter});

   // to create a copy of the original state ,so that it remains immutable
      CounterState copyCounter({int? counter}){
     return CounterState(counter: counter ?? this.counter);
      }

      @override
      String toString(){            // overriding tostring function to retuyrn counter value when [CounterState.toString] is called
        return "CounterState(counter : $counter)";
      }

// initializing / initial value of counter variables 
      factory CounterState.initial(){
        return const CounterState(counter: 0);
      }
}

// actions
class IncrementAction {     //  Action type 1
  final int payload;
  const IncrementAction({required this.payload});

   @override
      String toString(){            
        return "IncrementAction(payload : $payload)";
      }
}

class DecrementAction {     //  Action type 2
  final int payload;
  const DecrementAction({required this.payload});
  
   @override
      String toString(){            
        return "DecrementAction(payload : $payload)";
      }
}

// reducer
CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncrementAction) {   
    // if action is of type incrementAction
    return state.copyCounter(
        counter:
            state.counter + action.payload); // changing the state using action
  }
  if (action is DecrementAction) {
    return state.copyCounter(counter: state.counter - action.payload);
  }
  return state;
}

// void main(){

//  final store=Store(
//   counterReducer,        // reducer pure function
//   initialState: CounterState.initial()   // initial state
//   );
//  // we use a subscription variable so that we can stop listening to changes whenever we want by cancelling  
//  // the subscription
//  final subscription=store.onChange.listen((CounterState state){     
//     print("current state is $state");
//  });

//  store.dispatch(const IncrementAction(payload: 2));
//  store.dispatch(const IncrementAction(payload: 6));
//  store.dispatch(const DecrementAction(payload: 1));

// subscription.cancel();

// }