import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/HomePage/_avatar_glow.dart';
import 'widgets/HomePage/_play_with_bot.dart';
import 'widgets/HomePage/_play_with_friend.dart';
import 'widgets/HomePage/_rules.dart';
import 'widgets/HomePage/_title_.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: 1,
          fontSize: 14,
          fontFamily: 'PressStart2P'));
  static var myNewFontSmall = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: 1,
          fontSize: 10,
          fontFamily: 'PressStart2P'));
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 14,
          fontFamily: 'PressStart2P'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediaQuery.of(context).size.height > 580
                ? SizedBox(height: MediaQuery.of(context).size.height * 0.15)
                : SizedBox(height: 0),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: MediaQuery.of(context).size.height > 320
                  ? EdgeInsets.all(15)
                  : EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[900],
                      blurRadius: 20.0,
                    )
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Title_(myNewFontWhite: myNewFontWhite),
                    AvatarGlow_(),
                    PlayWithFriend_(
                        myNewFont: myNewFont, myNewFontSmall: myNewFontSmall),
                    PlayWithBot_(
                        myNewFont: myNewFont, myNewFontSmall: myNewFontSmall),
                    Rules_(myNewFont: myNewFont),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text("@BhavyaMehta", style: myNewFontWhite),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
