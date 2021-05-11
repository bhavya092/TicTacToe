import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Move.dart';
import 'HomePage.dart';
import './widgets/SinglePlayer/_bottom.dart';
import './widgets/SinglePlayer/_gameinfo.dart';

class SinglePlayerPage extends StatefulWidget {
  @override
  _SinglePlayerPageState createState() => _SinglePlayerPageState();
}

class _SinglePlayerPageState extends State<SinglePlayerPage> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  int aiwins = 0;
  int huwins = 0;
  bool gameOver = false;
  int filledboxes = 0;
  String result = '';
  bool aiturn = false;

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
  static var myNewFont = GoogleFonts.pressStart2P(
      textStyle: TextStyle(
          color: Colors.black,
          letterSpacing: 1,
          fontSize: 14,
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
              aiwins: aiwins,
              huwins: huwins,
              aiturn: aiturn),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (!aiturn) _tapped(index);
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
          Bottom_(result: result, myNewFont: myNewFont)
        ],
      ),
    ));
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
                    ? Text('YOU WIN',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green))
                    : Text('YOU LOOSE',
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
                    ? Text('  Yes you WON ! HURRAY! ',
                        style: TextStyle(fontSize: 14))
                    : Text(
                        ' OOPS! The AI WON ...',
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
                          Navigator.of(context, rootNavigator: true).pop();
                          _clearScreen(x);
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
                          Navigator.of(context, rootNavigator: true).pop();
                          _clearScreen('A');
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
      }

      if (x == 'O')
        huwins++;
      else if (x == 'X') aiwins++;
      filledboxes = 0;
      gameOver = false;
      aiturn = false;
    });
  }

  void _checkWinner() {
    int over = 0;
    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      over = 1;
      _showWinner(board[0]);
      return;
    }

    // checks 2nd row
    else if (board[3] == board[4] && board[3] == board[5] && board[3] != '') {
      over = 1;
      _showWinner(board[3]);
      return;
    }

    // checks 3rd row
    else if (board[6] == board[7] && board[6] == board[8] && board[6] != '') {
      over = 1;
      _showWinner(board[6]);
      return;
    }

    // checks 1st column
    else if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      over = 1;
      _showWinner(board[0]);
      return;
    }

    // checks 2nd column
    else if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      over = 1;
      _showWinner(board[1]);
      return;
    }

    // checks 3rd column
    else if (board[2] == board[5] && board[2] == board[8] && board[2] != '') {
      over = 1;
      _showWinner(board[2]);
      return;
    }

    // checks diagonal
    else if (board[6] == board[4] && board[6] == board[2] && board[6] != '') {
      over = 1;
      _showWinner(board[6]);
      return;
    }

    // checks diagonal
    else if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      over = 1;
      _showWinner(board[0]);
      return;
    } else if (filledboxes == 9) {
      _matchDraw();
      over = 1;
      return;
    }
    if (over == 1) {
      setState(() {
        gameOver = true;
      });
    }
  }

  int findResult(List<String> game) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (game[i] == game[i + 1] &&
          game[i + 1] == game[i + 2] &&
          game[i] != '') {
        if (game[i] == 'O') {
          return 1;
        } else if (game[i] == 'X') {
          return 2;
        }
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (game[i] == game[i + 3] &&
          game[i + 3] == game[i + 6] &&
          game[i] != '') {
        if (game[i] == 'O') {
          return 1;
        } else if (game[i] == 'X') {
          return 2;
        }
      }
    }

    // Check primary diagonal
    if (game[0] == game[4] && game[4] == game[8] && game[0] != '') {
      if (game[0] == 'O') {
        return 1;
      } else if (game[0] == 'X') {
        return 2;
      }
    }

    // Check secondary diagonal
    else if (game[2] == game[4] && game[4] == game[6] && game[2] != '') {
      if (game[2] == 'O') {
        return 1;
      } else if (game[2] == 'X') {
        return 2;
      }
    }

    // Check for empty spaces, if found -> game not over
    for (int i = 0; i < 9; i++) {
      if (game[i] == '') return -1;
    }

    // If no empty spaces and no winner then game is tied
    return 0;
  }

  int _getScore(List<String> s, int depth) {
    int res = findResult(s);
    if (res == 1)
      return 10 + depth;
    else if (res == 2) return depth - 10;

    return 0;
  }

  bool _isEndState(List<String> s) {
    var temp = findResult(s);
    if (temp == -1) return false;
    return true;
  }

// Minimax Algorithm
  Move _minimiser(List<String> s, int depth) {
    if (_isEndState(s)) {
      return Move(score: _getScore(s, depth), index: -1);
    }

    Move min = new Move(score: 1000, index: -1);

    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'X';

        Move curr = _maximiser(s, depth + 1);
        if (curr.score < min.score) {
          min.score = curr.score;
          min.index = i;
        }
        s[i] = '';
      }
    }
    return min;
  }

  Move _maximiser(List<String> s, int depth) {
    if (_isEndState(s)) {
      return Move(score: _getScore(s, depth), index: -1);
    }

    Move max = new Move(score: -1000, index: -1);

    for (int i = 0; i < 9; i++) {
      if (s[i] == '') {
        s[i] = 'O';

        Move curr = _minimiser(s, depth + 1);
        if (curr.score > max.score) {
          max.score = curr.score;
          max.index = i;
        }
        s[i] = '';
      }
    }
    return max;
  }

  void _nextAiMove() {
    if (!gameOver) {
      Move best = _minimiser(board, 0);
      print('Game sets -> ${best.index}');
      Timer(Duration(seconds: 2), () {
        setState(() {
          board[best.index] = 'X';
          filledboxes++;
          aiturn = !aiturn;
          _checkWinner();
        });
      });
    }
  }

  void _tapped(int index) {
    if (board[index] == '') {
      setState(() {
        filledboxes = filledboxes + 1;
        board[index] = 'O';
        aiturn = !aiturn;
      });
    }
    _checkWinner();
    _nextAiMove();
  }
}
