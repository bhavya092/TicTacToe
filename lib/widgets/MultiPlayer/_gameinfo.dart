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
    @required this.owins,
    @required this.xwins,
    @required this.oturn,
  }) : super(key: key);

  final TextStyle myNewFontWhite;
  final TextStyle myNewFontWhiteSmall;
  final int owins;
  final int xwins;
  final bool oturn;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ScoreBoardTitle_(myNewFontWhite: myNewFontWhite),
        Scores_(
            myNewFontWhite: myNewFontWhite,
            myNewFontWhiteSmall: myNewFontWhiteSmall,
            owins: owins,
            xwins: xwins),
        SizedBox(
          height: 10,
        ),
        CurrentPlayerTurn_(oturn: oturn, myNewFontWhite: myNewFontWhite)
      ],
    ));
  }
}
