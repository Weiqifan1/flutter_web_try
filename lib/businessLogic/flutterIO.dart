//this class is for interacting with the IO device
//(in this case flutter)
//the class should also handle interaction with external libraries
//like libraries for text-to-speech handling ect
// (the class should handle calls to another class named for example "ttsIO")

import 'businessController.dart';

class flutterIO {

  String ioFileInput;

  flutterIO(this.ioFileInput);

  String getResult(){
    print("flutterIO (getResult())");
    return getAnkiCSVconstructFromFile(ioFileInput);
  }

  void setIOFileInput(String input){
    if (invalidFileDataFormatFrontend(input)) {
      ioFileInput = 'error: bad file input';
    }else {
      ioFileInput = input;
    }
  }


  bool invalidFileDataFormatFrontend(String input) {
    return false;
  }

}



//end