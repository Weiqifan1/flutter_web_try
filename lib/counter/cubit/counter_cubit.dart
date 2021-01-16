import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<String> {
  /// {@macro counter_cubit}
  CounterCubit() : super("");

  /// Add 1 to the current state.
  void increment() => emit((new chrCubitHelper()).makeBigger(state));//emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit((new chrCubitHelper()).makeSmaller(state));//emit(state - 1);
}

class chrCubitHelper {

  chrCubitHelper();

  String makeBigger(String input){
    String result = input + 'ab';
    return result;
  }

  String makeSmaller(String input){
    if (input.length > 3) {
      String result = input.substring(0, input.length-1);
      return result;
    }else {
      return input;
    }
  }


}