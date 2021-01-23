
import 'package:flutter_web_try/businessLogic/assets/cedict/cedictEntryObject.dart';
import 'package:flutter_web_try/businessLogic/assets/cedict/cedictService.dart';
import 'package:test/test.dart';

void main() {

  test('cedictEntryObject testIfGoodObjectsGetCreates', () {
    List<String> cedict3Lists = [];//new List.filled(
    cedict3Lists.add('''2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/''');
    cedict3Lists.add('''21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/''');
    cedict3Lists.add('''3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/''');
    cedict3Lists.add('''3P 3P [san1 P] /(slang) threesome/''');

    List<List<String>> cedictCandidates = [];
    List<String> kandidate_1 = [
      '''2019冠狀病毒病''',
      '''2019冠状病毒病''',
      '''[er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4]''',
      '''/COVID-19, the coronavirus disease identified in 2019/'''
    ];
    List<String> kandidate_2 = [
      '''3C''',
      '''3C''',
      '''[san1 C]''',
      '''/abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/'''
    ];
    cedictCandidates.add(kandidate_1);
    cedictCandidates.add(kandidate_2);


    CedictEntryObject entryObject = new CedictEntryObject();
    List<CedictEntryObject> entryObjects = [];
    for (List<String> each in cedictCandidates) {
      CedictEntryObject eachObject = entryObject.create(each[0], each[1], each[2], each[3]);
      if (eachObject != null) {
        entryObjects.add(eachObject);
      }
    }



    expect(entryObjects.length, 2);

  });
}