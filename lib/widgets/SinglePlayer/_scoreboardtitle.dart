import 'package:flutter/material.dart';

// ignore: camel_case_types
class ScoreBoardtitle_ extends StatelessWidget {
  const ScoreBoardtitle_({
    Key key,
    @required this.myNewFontWhite,
  }) : super(key: key);

  final TextStyle myNewFontWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 15)],
      ),
      child: Text("SCOREBOARD",
          textAlign: TextAlign.center,
          style: myNewFontWhite.copyWith(fontSize: 26)),
    );
  }
}
