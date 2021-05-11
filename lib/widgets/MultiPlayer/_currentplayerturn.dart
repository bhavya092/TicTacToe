import 'package:flutter/material.dart';

// ignore: camel_case_types
class CurrentPlayerTurn_ extends StatelessWidget {
  const CurrentPlayerTurn_({
    Key key,
    @required this.oturn,
    @required this.myNewFontWhite,
  }) : super(key: key);

  final bool oturn;
  final TextStyle myNewFontWhite;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: oturn
          ? Text("Player O's turn.",
              style: myNewFontWhite.copyWith(fontSize: 10))
          : Text("Player X's turn.",
              style: myNewFontWhite.copyWith(fontSize: 10)),
    );
  }
}
