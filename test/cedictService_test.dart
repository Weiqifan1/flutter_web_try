
import 'dart:convert';

import 'package:flutter_web_try/businessLogic/assets/cedict/cedictService.dart';
import 'package:test/test.dart';

void main() {
  String cedict3RawLines = '''2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/
21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/
3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/
3P 3P [san1 P] /(slang) threesome/''';


  test('cedictService.cedictToJson', () {

    String stringToTest = '''#! publisher=MDBG
#! license=https://creativecommons.org/licenses/by-sa/4.0/
#! date=2021-01-23T06:23:33Z
#! time=1611383013
% % [pa1] /percent (Tw)/
2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/
21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/
3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/
3P 3P [san1 P] /(slang) threesome/''';

    String old = '''2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/
21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/
3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/
3P 3P [san1 P] /(slang) threesome/''';

    List<String> cedict3Lists = [];//new List.filled(
    cedict3Lists.add('''2019冠狀病毒病 2019冠状病毒病 [er4 ling2 yi1 jiu3 guan1 zhuang4 bing4 du2 bing4] /COVID-19, the coronavirus disease identified in 2019/''');
    cedict3Lists.add('''21三體綜合症 21三体综合症 [er4 shi2 yi1 san1 ti3 zong1 he2 zheng4] /trisomy/Down's syndrome/''');
    cedict3Lists.add('''3C 3C [san1 C] /abbr. for computers, communications, and consumer electronics/China Compulsory Certificate (CCC)/''');
    cedict3Lists.add('''3P 3P [san1 P] /(slang) threesome/''');

    var cedictService = new CedictService();
    var result = cedictService.cedictRawTOList(stringToTest);

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(stringToTest);

    expect(result, lines);
  });
}