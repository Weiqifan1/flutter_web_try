

//create methods for communicating with the asssets and the flutter IO

import 'dart:async';

import 'assets/cedict/cedictController.dart';
import 'assets/cedict/cedictService.dart';

Future<String> getCedictObject(String input){
  Future<String> cedictControllerOutput = generateCeddictObject(input);
  print("businessController (getCedictObject)");
  return cedictControllerOutput;
}

Future<String> getErrorString(String input){
  var completer = new Completer<String>();

  // At some time you need to complete the future:
  completer.complete(input);

  return completer.future;
}

Future<String> getAnkiCSVconstructFromFile(String input){
  Future<String> result;
  var cedictService = new CedictService();

  if (invalidFileDataFormatBackend(input)) {
    result = getErrorString('error: bad file data format');// as Future<String>;
    return result;
  }else {
    print("businessController (getAnkiCSVconstructFromFile)");
    result = getCedictObject(input);
  }

  result = result.then((cedictContent) => cedictService.cedictToJson(cedictContent));

  return result;
}

bool invalidFileDataFormatBackend(String input) {
  return false;
}

//slut