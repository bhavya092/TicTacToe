import 'package:flutter/material.dart';

// ignore: camel_case_types
class Bottom_ extends StatelessWidget {
  const Bottom_({
    Key key,
    @required this.myNewFontWhite,
  }) : super(key: key);

  final TextStyle myNewFontWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orange,
            ),
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Go Back",
                    style: myNewFontWhite.copyWith(fontSize: 10))),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
