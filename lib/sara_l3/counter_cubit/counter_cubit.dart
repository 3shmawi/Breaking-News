import 'package:c3/sara_l3/counter_cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialState());

  int counter = 0;

  int number = 0;

  void increment() {
    counter++;
    emit(IncrementState());
  }


  void decrement() {
    counter--;
    emit(DecrementState());
  }

  void clear(){
    counter = 0;
    emit(ClearState());
  }


}
