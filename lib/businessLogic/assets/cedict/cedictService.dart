
//find out how to create a hashmap and how to serialize it. after that:
// create the object structure for a cedict entry and a cedict line parser
// to create object instances.class

import 'dart:collection';

import 'dart:convert';

//2021 01 18 kl. 17.18
//how to serialize data:
//https://stackoverflow.com/questions/61691991/how-to-properly-serialize-deserialize-a-map-in-dart-flutter

String returnFinishedMapResult(String input){

  HashMap cedict = HashMap<String, String>();
  cedict['chr'] = 'Lykke';
  cedict['smutvej'] = 'strandgaarden';


  User myUser = User('chr', 'chrEmail');
  var jsonUser  = jsonEncode(myUser);


  Map userMap = jsonDecode(jsonUser);
  var finaluser = User.fromJson(userMap);

  return finaluser.name;
}



class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
      };
}




//slut