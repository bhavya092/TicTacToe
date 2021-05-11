import 'package:flutter/material.dart';

// ignore: camel_case_types
class CurrentPlayerTurn_ extends StatelessWidget {
  const CurrentPlayerTurn_({
    Key key,
    @required this.aiturn,
    @required this.myNewFontWhiteSmall,
  }) : super(key: key);

  final bool aiturn;
  final TextStyle myNewFontWhiteSmall;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: aiturn
          ? Text("The AI is thinking..", style: myNewFontWhiteSmall)
          : Text("Your Turn.", style: myNewFontWhiteSmall),
    );
  }
}
