import 'package:flutter/material.dart';
import './_scoreboardtitle.dart';
import './_scores.dart';
import './_currentplayerturn.dart';

// ignore: camel_case_types
class GameInfo_ extends StatelessWidget {
  const GameInfo_({
    Key key,
    @required this.myNewFontWhite,
    @required this.myNewFontWhiteSmall,
    @required this.aiwins,
    @required this.huwins,
    @required this.aiturn,
  }) : super(key: key);

  final TextStyle myNewFontWhite;
  final TextStyle myNewFontWhiteSmall;
  final int aiwins;
  final int huwins;
  final bool aiturn;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ScoreBoardtitle_(myNewFontWhite: myNewFontWhite),
        Scores_(
            myNewFontWhite: myNewFontWhite,
            myNewFontWhiteSmall: myNewFontWhiteSmall,
            aiwins: aiwins,
            huwins: huwins),
        SizedBox(
          height: 10,
        ),
        CurrentPlayerTurn_(
            aiturn: aiturn, myNewFontWhiteSmall: myNewFontWhiteSmall)
      ],
    ));
  }
}
