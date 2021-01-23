
import 'package:flutter_web_try/businessLogic/assets/cedict/cedictService.dart';
import 'package:test/test.dart';

void main() {
  test('cedictService.cedictToJson', () {

    String stringToTest = '''2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/
21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/
3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/
3P 3P [san1 P] /(slang) threesome/''';

    var cedictService = new CedictService();
    var result = cedictService.cedictToJson(stringToTest);

    expect(result, stringToTest+'hello');
  });
}