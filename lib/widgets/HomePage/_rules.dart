import 'package:flutter/material.dart';
import '../../RulesPage.dart';

// ignore: camel_case_types
class Rules_ extends StatelessWidget {
  const Rules_({
    Key key,
    @required this.myNewFont,
  }) : super(key: key);

  final TextStyle myNewFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: FlatButton.icon(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => RulesPage()));
          },
          icon: Icon(Icons.library_books_outlined,
              color: Colors.orangeAccent, size: 25),
          label: Text(
            'RULES',
            style: myNewFont,
          )),
    );
  }
}
