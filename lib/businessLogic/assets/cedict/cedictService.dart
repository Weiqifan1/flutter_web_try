
//find out how to create a hashmap and how to serialize it. after that:
// create the object structure for a cedict entry and a cedict line parser
// to create object instances.class

import 'dart:collection';
import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:flutter/services.dart' show rootBundle;

//async functions
Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<String> asyncGetRawCedict(String input) {
  Future<String> fileContent = loadAsset('testfile.txt');
  return fileContent;
}

//sync functions

String cedictToJson(String input){
  return input + "hello";
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

//2021 01 23: skriv data til file:
/*  List<String> file_contents = ["test\n"];
  Blob blob = new Blob(file_contents, 'text/plain', 'native');

  FileSystem _filesystem = await window.requestFileSystem(1024 * 1024, persistent: false);
  FileEntry fileEntry = await _filesystem.root.createFile('dart_test.csv');
  FileWriter fw = await fileEntry.createWriter();
  fw.write(blob);
  File file = await fileEntry.file();*/

//slut