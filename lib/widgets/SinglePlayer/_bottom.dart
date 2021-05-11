import 'package:flutter/material.dart';
import '../../HomePage.dart';

// ignore: camel_case_types
class Bottom_ extends StatelessWidget {
  const Bottom_({
    Key key,
    @required this.result,
    @required this.myNewFont,
  }) : super(key: key);

  final String result;
  final TextStyle myNewFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(result, style: myNewFont),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => HomePage()));
                    },
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 20, color: Colors.red),
                    label: Text("Go Back !", style: myNewFont)),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
