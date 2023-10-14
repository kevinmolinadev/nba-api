import 'package:flutter/material.dart';
import 'package:nba/src/api/games.dart';

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset("assets/player.png"),
        ),
    );
  }
}