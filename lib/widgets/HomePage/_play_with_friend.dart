import 'package:flutter/material.dart';
import '../../MultiPlayerPage.dart';

// ignore: camel_case_types
class PlayWithFriend_ extends StatelessWidget {
  const PlayWithFriend_({
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
                .push(MaterialPageRoute(builder: (ctx) => MultiPlayerPage()));
          },
          icon: Icon(Icons.person, color: Colors.pink, size: 25),
          label: Text(
            'PLAY WITH FRIEND',
            style: MediaQuery.of(context).size.width > 320
                ? myNewFont
                : myNewFontSmall,
          )),
    );
  }
}
