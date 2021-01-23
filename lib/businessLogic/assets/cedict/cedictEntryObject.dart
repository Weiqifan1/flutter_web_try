

import 'dart:convert';

class CedictEntryObject{

  String traditionalEntry;
  String simplifiedEntry;
  String pinyinBrackets;
  String meaning;

  CedictEntryObject create(
      String possibleTrad,
      String possibleSimp,
      String possiblePinyin,
      String possibleMeaning){
    bool acceptable = _acceptableEntry(
         possibleTrad,
         possibleSimp,
         possiblePinyin,
         possibleMeaning);
    if (acceptable) {
      CedictEntryObject newObj = CedictEntryObject();
      newObj._setAllValues(possibleTrad, possibleSimp, possiblePinyin, possibleMeaning);
      return newObj;
    }else {
      return null;
    }
  }

  String _setAllValues(String trad, String simp, String pinyin, String meaning){
    this.traditionalEntry = trad;
    this.simplifiedEntry = simp;
    this.pinyinBrackets = pinyin;
    this.meaning = meaning;
  }

  bool _acceptableEntry(
      String possibleTrad,
      String possibleSimp,
      String possiblePinyin,
      String possibleMeaning){
    bool result;
    bool test1 = _acceptableTrad(possibleTrad);
    bool test2 = _acceptableSimp(possibleSimp);
    bool test3 = _acceptablePinyin(possiblePinyin);
    bool test4 = _acceptableMeaning(possibleMeaning);
    result = test1 && test2 && test3 && test4;
    return result;
  }

  bool _acceptableMeaning(String possibleMeaning){
    bool result;
    bool test1 = possibleMeaning != "";
    bool test2 = possibleMeaning != null;
    bool test3 = possibleMeaning.trim() != "";
    List<String> splittetString = possibleMeaning.trim().split("");
    bool test4 = splittetString.first == "/" && splittetString.last == "/";
    result = test1 && test2 && test3 && test4;
    return result;
  }

  bool _acceptablePinyin(String possiblePinyin){
    bool result;
    bool test1 = possiblePinyin != "";
    bool test2 = possiblePinyin != null;
    bool test3 = possiblePinyin.trim() != "";
    List<String> splittetString = possiblePinyin.trim().split("");
    bool test4 = splittetString.first == "[" && splittetString.last == "]";
    result = test1 && test2 && test3 && test4;
    return result;
  }

  bool _acceptableSimp(String possibleSimp){
    bool result;
    bool test1 = possibleSimp != "";
    bool test2 = possibleSimp != null;
    bool test3 = possibleSimp.trim() != "";
    result = test1 && test2 && test3;
    return result;
  }

  bool _acceptableTrad(String possibleTrad){
    bool result;
    bool test1 = possibleTrad != "";
    bool test2 = possibleTrad != null;
    bool test3 = possibleTrad.trim() != "";
    result = test1 && test2 && test3;
    return result;
  }

}


//slut