import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker_app/app/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());

  // to easily use it with all app screens
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void minus()
  {
    counter--;
    emit(CounterMinusState());
  }
  void plus()
  {
    counter++;
    emit(CounterPlusState());
  }
}