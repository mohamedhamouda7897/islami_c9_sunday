import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_sunday/hadeth_model.dart';

class AhadethTab extends StatelessWidget {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    loadHadeth();
    return Column(
      children: [],
    );
  }

  void loadHadeth() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");

      for (int i = 0; i < ahadethList.length; i++) {
        String HadethOne = ahadethList[i];
        List<String> hadethOneLines = HadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        print(hadethModel.title);
        print("$i");
        allAhadeth.add(hadethModel);
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
