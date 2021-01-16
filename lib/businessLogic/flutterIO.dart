//this class is for interacting with the IO device
//(in this case flutter)
//the class should also handle interaction with external libraries
//like libraries for text-to-speech handling ect
// (the class should handle calls to another class named for example "ttsIO")

class flutterIO {

  String ioFileInput;

  flutterIO(this.ioFileInput);

  String getResult(){
    return 'result: ' + ioFileInput;
  }

  void setIOFileInput(String input){
    ioFileInput = input;
  }

}



//end