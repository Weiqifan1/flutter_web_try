

//create methods for communicating with the asssets and the flutter IO

import 'assets/cedict/cedictController.dart';

String getCedictObject(String input){
  String cedictControllerOutput = generateCeddictObject(input);
  print("businessController (getCedictObject)");
  return cedictControllerOutput;
}

String getAnkiCSVconstructFromFile(String input){
  if (invalidFileDataFormatBackend(input)) {
    return 'error: bad file data format';
  }else {
    print("businessController (getAnkiCSVconstructFromFile)");
    return getCedictObject(input);
  }
}

bool invalidFileDataFormatBackend(String input) {
  return false;
}

//slut