import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class AvatarGlow_ extends StatelessWidget {
  const AvatarGlow_({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AvatarGlow(
        endRadius: 150,
        duration: Duration(seconds: 2),
        glowColor: Colors.white,
        repeat: true,
        repeatPauseDuration: Duration(seconds: 0),
        startDelay: Duration(seconds: 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.none,
              ),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Container(
              child: Image.asset(
                './image/tictactoelogo.png',
                color: Colors.black,
                fit: BoxFit.scaleDown,
              ),
            ),
            radius: 80.0,
          ),
        ),
      ),
    );
  }
}
