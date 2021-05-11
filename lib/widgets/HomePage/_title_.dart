import 'package:flutter/material.dart';

// ignore: camel_case_types
class Title_ extends StatelessWidget {
  const Title_({
    Key key,
    @required this.myNewFontWhite,
  }) : super(key: key);

  final TextStyle myNewFontWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Text(
            "TIC TAC TOE",
            style: MediaQuery.of(context).size.width > 320
                ? myNewFontWhite.copyWith(fontSize: 24)
                : myNewFontWhite,
          ),
        ),
      ),
    );
  }
}
