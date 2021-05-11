import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './HomePage.dart';
import './widgets/MultiPlayer/_gameinfo.dart';
import './widgets/MultiPlayer/_bottom.dart';

class MultiPlayerPage extends StatefulWidget {
  @override
  _MultiPlayerPageState createState() => _MultiPlayerPageState();
}

class _MultiPlayerPageState extends State<MultiPlayerPage> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  bool oturn = true;
  int owins = 0;
  int xwins = 0;
  int filledboxes = 0;
  List<bool> cantap = [true, true, true, true, true, true, true, true, true];
  static var myNewFontWhite = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1.2,
          fontSize: 15,
          fontFamily: 'PressStart2P'));
  static var myNewFontWhiteSmall = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 12,
          fontFamily: 'PressStart2P'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 10.0,
            )
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 1)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          GameInfo_(
              myNewFontWhite: myNewFontWhite,
              myNewFontWhiteSmall: myNewFontWhiteSmall,
              owins: owins,
              xwins: xwins,
              oturn: oturn),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (cantap[index]) _tapped(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[700])),
                        child: Center(
                          child: Text(board[index],
                              style: myNewFontWhite.copyWith(fontSize: 26)),
                        )),
                  );
                }),
          ),
          Bottom_(myNewFontWhite: myNewFontWhite)
        ],
      ),
    ));
  }

  void _tapped(int index) {
    if (board[index] == '') {
      setState(() {
        cantap[index] = false;
        filledboxes = filledboxes + 1;
        if (!oturn) {
          board[index] = 'X';
          oturn = !oturn;
        } else {
          board[index] = 'O';
          oturn = !oturn;
        }
      });
    }
    _checkWinner();
  }

  void _showWinner(String x) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            elevation: 10,
            content: FittedBox(
                child: Column(
              children: <Widget>[
                x == 'O'
                    ? Text('Player O WINS',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green))
                    : Text('PLAYER X WINS',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                SizedBox(height: 5),
                const Divider(
                  color: Colors.black,
                  height: 10,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                x == 'O'
                    ? Text('Congratulations Player O!',
                        style: TextStyle(fontSize: 14))
                    : Text(
                        'Congratulations Player X!',
                        style: TextStyle(fontSize: 14),
                      ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                        color: Colors.blueGrey[100],
                        label: Text("Home"),
                        icon: Icon(Icons.arrow_back, color: Colors.cyan),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => HomePage()));
                          Navigator.of(context, rootNavigator: true).pop();
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    FlatButton.icon(
                        color: Colors.blueGrey[100],
                        label: Text("Play Again"),
                        icon: Icon(Icons.replay, color: Colors.green),
                        onPressed: () {
                          _clearScreen(x);
                          Navigator.of(context, rootNavigator: true).pop();
                        }),
                  ],
                )
              ],
            )),
          );
        });
  }

  void _matchDraw() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            elevation: 10,
            content: FittedBox(
                child: Column(
              children: <Widget>[
                Text('MATCH DRAW',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                SizedBox(height: 5),
                const Divider(
                  color: Colors.black,
                  height: 10,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                Text('  No One won! Better luck next time!',
                    style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                        color: Colors.blueGrey[100],
                        label: Text("Home"),
                        icon: Icon(Icons.arrow_back, color: Colors.cyan),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => HomePage()));
                          Navigator.of(context, rootNavigator: true).pop();
                        }),
                    SizedBox(
                      height: 5,
                    ),
                    FlatButton.icon(
                        color: Colors.blueGrey[100],
                        label: Text("Play Again"),
                        icon: Icon(Icons.replay, color: Colors.green),
                        onPressed: () {
                          _clearScreen('A');
                          Navigator.of(context, rootNavigator: true).pop();
                        }),
                  ],
                )
              ],
            )),
          );
        });
  }

  void _clearScreen(String x) {
    setState(() {
      for (int i = 0; i < 9; i++) {
        board[i] = '';
        cantap[i] = true;
      }
      oturn = false;
      if (x == 'O')
        owins++;
      else if (x == 'X') xwins++;
      filledboxes = 0;
    });
  }

  void _checkWinner() {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      _showWinner(board[0]);
      return;
    }

    // checks 2nd row
    if (board[3] == board[4] && board[3] == board[5] && board[3] != '') {
      _showWinner(board[3]);
      return;
    }

    // checks 3rd row
    if (board[6] == board[7] && board[6] == board[8] && board[6] != '') {
      _showWinner(board[6]);
      return;
    }

    // checks 1st column
    if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      _showWinner(board[0]);
      return;
    }

    // checks 2nd column
    if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      _showWinner(board[1]);
      return;
    }

    // checks 3rd column
    if (board[2] == board[5] && board[2] == board[8] && board[2] != '') {
      _showWinner(board[2]);
      return;
    }

    // checks diagonal
    if (board[6] == board[4] && board[6] == board[2] && board[6] != '') {
      _showWinner(board[6]);
      return;
    }

    // checks diagonal
    if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      _showWinner(board[0]);
      return;
    } else if (filledboxes == 9) {
      _matchDraw();
    }
  }
}
