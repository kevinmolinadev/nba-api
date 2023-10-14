import 'package:flutter/material.dart';
import 'package:nba/src/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 146, 212),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "NBA",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              "assets/team.png",
              fit: BoxFit.fill,
            ),
          )
        ]),
      ),
      body: const Column(
        children: [
          Home(),
        ],
      ),
    );
  }
}
