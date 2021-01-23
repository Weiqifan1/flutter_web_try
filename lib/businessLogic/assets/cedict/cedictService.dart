
//find out how to create a hashmap and how to serialize it. after that:
// create the object structure for a cedict entry and a cedict line parser
// to create object instances.class

//sync functions

import 'dart:convert';

class CedictService {
  String cedictToJson(String rawCedictContent){
    //return rawCedictContent + "hello";

    return "hello";

  }

  List<String> cedictRawTOList(String rawCedictContent){

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(rawCedictContent);
    return lines;
  }




}



//slut