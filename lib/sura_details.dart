import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_sunday/my_theme_data.dart';
import 'package:islami_c9_sunday/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SUraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadString(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        body: Card(
          margin: EdgeInsets.all(14),
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: MyThemeData.primary),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: MyThemeData.primary,
                thickness: 1,
                endIndent: 40,
                indent: 40,
              ),
              itemBuilder: (context, index) {
                return Text(
                  "${verses[index]}(${index + 1})",
                  textAlign: TextAlign.center,
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  void loadString(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> lines = sura.split("\n");

    print(lines);
    verses = lines;
    setState(() {});
  }
}
