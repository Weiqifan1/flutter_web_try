

//create methods for communicating with the asssets and the flutter IO

import 'assets/cedict/cedictController.dart';

String getCedictObject(String input){
  String cedictControllerOutput = generateCeddictObject(input);
  return 'handleCedict: ' + cedictControllerOutput;
}

String getAnkiCSVconstructFromFile(String input){
  if (invalidFileDataFormatBackend(input)) {
    return 'error: bad file data format';
  }else {
    return 'AnkiCSVConstruct: ' + getCedictObject(input);
  }
}

bool invalidFileDataFormatBackend(String input) {
  return false;
}

//slut