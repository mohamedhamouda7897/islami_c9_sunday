import 'package:flutter/material.dart';

import 'hadeth_model.dart';
import 'my_theme_data.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
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
                args.title,
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
                    "${args.content[index]}(${index + 1})",
                    textAlign: TextAlign.center,
                  );
                },
                itemCount: args.content.length,
              ),
            ),
          ),
        ));
  }
}
