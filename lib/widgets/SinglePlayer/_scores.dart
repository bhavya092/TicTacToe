import 'package:flutter/material.dart';

// ignore: camel_case_types
class Scores_ extends StatelessWidget {
  const Scores_({
    Key key,
    @required this.myNewFontWhite,
    @required this.myNewFontWhiteSmall,
    @required this.aiwins,
    @required this.huwins,
  }) : super(key: key);

  final TextStyle myNewFontWhite;
  final TextStyle myNewFontWhiteSmall;
  final int aiwins;
  final int huwins;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Text(" AI ",
                    style: MediaQuery.of(context).size.width > 500
                        ? myNewFontWhite
                        : myNewFontWhiteSmall),
                SizedBox(height: 10),
                Text(aiwins.toString(), style: myNewFontWhite)
              ],
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Text("YOU ",
                    style: MediaQuery.of(context).size.width > 500
                        ? myNewFontWhite
                        : myNewFontWhiteSmall),
                SizedBox(height: 10),
                Text(huwins.toString(), style: myNewFontWhite),
              ],
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
