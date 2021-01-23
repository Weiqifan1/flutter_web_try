import 'package:bloc/bloc.dart';
import 'package:flutter_web_try/businessLogic/flutterIO.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<String> {
  /// {@macro counter_cubit}
  CounterCubit() : super("");
  flutterIO flutterio = new flutterIO('userinput');

  String currentUserInputState = "";
  String currentInputFilePath = "";
  String userInputFileContent = "";
  String userOutputFileContent = "fummy output content";

  void setUserInputState(String input){
    currentUserInputState = input;
  }
  String getUserInputState(){
    return currentUserInputState;
  }
  void displayUserInputState(){
    emit(currentUserInputState);
  }

  void setCurrentInputFilePath(String input){
    currentInputFilePath = input;
  }
  String getCurrentInputFilePath(){
    return currentInputFilePath;
  }
  void displayCurrentInputFilePath(){
    emit(currentInputFilePath);
  }

  void setUserInputFileContent(String input){
    userInputFileContent = input;
    setUserOutputFileContent(input);
  }
  String getUserInputFileContent(){
    return userInputFileContent;
  }
  void displayUserInputFileContent(){
    emit(userInputFileContent);
  }

  void setUserOutputFileContent(String input){
    //userOutputFileContent = input;
    flutterio.setIOFileInput(input);
  }
  Future<String> getUserOutputFileContent(){
    //return userOutputFileContent;
    userOutputFileContent = "resultIsAsyncAndCannotBeShown";
    var result = flutterio.getResult();
    return result;
  }

  void displayUserOutputFileContent(){
    if (userOutputFileContent.length > 25) {
      emit(userOutputFileContent.substring(0, 20) + '...ect');
    }else {
      emit(userOutputFileContent);
    }
  }


  /// Add 1 to the current state.
  void increment() {
    String result = (new chrCubitHelper()).makeBigger(state);
    currentUserInputState = result;
    emit(result);
  }//=> emit((new chrCubitHelper()).makeBigger(state));//emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement(){
    String result =(new chrCubitHelper()).makeSmaller(state);
    currentUserInputState = result;
    emit(result);
  }// => emit((new chrCubitHelper()).makeSmaller(state));//emit(state - 1);
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