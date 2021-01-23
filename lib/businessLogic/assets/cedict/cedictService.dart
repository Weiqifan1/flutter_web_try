
//find out how to create a hashmap and how to serialize it. after that:
// create the object structure for a cedict entry and a cedict line parser
// to create object instances.class

import 'dart:collection';
import 'dart:convert';

String returnFinishedMapResult(String input){

  var identifier = new Map();
  identifier["1"] = "et";
  identifier["2"] = "to";
  identifier["3"] = "tre";
  String rawJson = jsonEncode(identifier);
  Map<String, dynamic> map = jsonDecode(rawJson);

  return map["2"];
}




// 2021 01 23: der kan kan lave et map til json og tilbage
/*
 var identifier = new Map();
  identifier["1"] = "et";
  identifier["2"] = "to";
  identifier["3"] = "tre";
  String rawJson = jsonEncode(identifier);
  Map<String, dynamic> map = jsonDecode(rawJson);
*/


//slut