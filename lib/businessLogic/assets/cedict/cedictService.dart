
//find out how to create a hashmap and how to serialize it. after that:
// create the object structure for a cedict entry and a cedict line parser
// to create object instances.class

import 'dart:collection';

import 'dart:convert';

//2021 01 18 kl. 17.18
//how to serialize data:
//https://stackoverflow.com/questions/61691991/how-to-properly-serialize-deserialize-a-map-in-dart-flutter

String returnFinishedMapResult(String input){

  HashMap cedict = HashMap<String, CedictEntry>();
  cedict['chr'] = CedictEntry('chr', 'is my name');
  cedict['smutvej'] = CedictEntry('smutvej', 'is my home');


  CedictEntry myUser = CedictEntry('chr', 'chrEmail');
  var jsonUser  = jsonEncode(myUser);
  Map userMap = jsonDecode(jsonUser);
  var finaluser = CedictEntry.fromJson(userMap);

  CedictMap mymap = CedictMap(cedict);
  var jsonmap  = jsonEncode(mymap);
  Map cedictmap = jsonDecode(jsonmap);
  //var finalcedict = CedictMap.fromJson(cedictmap);

  return finaluser.key;
}


class CedictMap {
  final HashMap<String, CedictEntry> cedict;

  CedictMap(this.cedict);

  CedictMap.fromJson(Map<String, dynamic> json)
      : cedict = json['cedict'];

  Map<String, dynamic> toJson() =>
      {
        'cedict': cedict,
      };
}

class CedictEntry {
  final String key;
  final String meaning;

  CedictEntry(this.key, this.meaning);

  CedictEntry.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        meaning = json['meaning'];

  Map<String, dynamic> toJson() =>
      {
        'key': key,
        'meaning': meaning,
      };
}




//slut