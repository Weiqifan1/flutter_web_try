
import 'cedictService.dart';
import 'cedictFileGenerator.dart';

Future<String> generateCeddictObject(String input) {
  print("cedictController (generateCeddictObject)");

  var cedictFileGenerator = new CedictFileGenerator();
  return cedictFileGenerator.asyncGetRawCedict(input);
}

/// takes a string that might consist of an entry in cedict.
///
/// returns the cedict meaning of the string.
/// if not in cedict, retuns an empty string.
String getMeaningFromChars(String stringOfChars) {
  return stringOfChars;
}

/// takes a string that might consist of an entry in cedict.
///
/// returns the traditional chinese version of the string.
/// if the traditional version is identical, returns an identical string
/// if not in cedict, returns an empty string.
String getTraditional(String stringOfChars){
  return stringOfChars;
}

/// takes a string that might consist of an entry in cedict.
///
/// returns the simplified chinese version of the string.
/// if the simplified version is identical, returns an identical string
/// if not in cedict, returns an empty string.
String getSimplified(String stringOfChars){
  return stringOfChars;
}

//2021/01/18 create methods for serializeing cedict.


//slut