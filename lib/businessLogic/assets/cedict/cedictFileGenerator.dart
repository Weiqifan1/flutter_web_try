
import 'dart:collection';
import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:flutter/services.dart' show rootBundle;

class CedictFileGenerator {

//async functions
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> asyncGetRawCedict(String input) {
    Future<String> fileContent = loadAsset('testfile.txt');
    return fileContent;
  }
}