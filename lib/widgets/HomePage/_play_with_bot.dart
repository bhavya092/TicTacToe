import 'package:flutter/material.dart';
import '../../SinglePlayerPage.dart';

// ignore: camel_case_types
class PlayWithBot_ extends StatelessWidget {
  const PlayWithBot_({
    Key key,
    @required this.myNewFont,
    @required this.myNewFontSmall,
  }) : super(key: key);

  final TextStyle myNewFont;
  final TextStyle myNewFontSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: FlatButton.icon(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SinglePlayerPage()));
          },
          icon: Icon(Icons.android, color: Colors.green, size: 25),
          label: Text(
            'PLAY WITH BOT',
            style: MediaQuery.of(context).size.width > 320
                ? myNewFont
                : myNewFontSmall,
          )),
    );
  }
}
