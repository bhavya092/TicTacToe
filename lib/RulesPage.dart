import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesPage extends StatelessWidget {
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      fontSize: 14,
      textStyle: TextStyle(color: Colors.white, fontFamily: 'PressStart2P'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.085),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.98,
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
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.orange,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "RULES",
                      style: myNewFontWhite.copyWith(fontSize: 26),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "1. The game is played on a grid that's 3 squares by 3 squares.",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 10),
                  Text(
                      "2. You are X, your friend (or the computer) is O. Players take turns putting their marks in empty squares.",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 10),
                  Text(
                      "3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 10),
                  Text(
                      "4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset(
                      './image/rules.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
