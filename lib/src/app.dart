import 'package:flutter/material.dart';
import 'package:nba/src/pages/teams.dart';
import 'package:nba/src/pages/games.dart';
import 'package:nba/src/pages/players.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Teams(),
    Games(),
    Players()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 138, 209),
        title: Align(
          alignment: Alignment.center,
          child: Container(
            height: 42,
            child: SvgPicture.asset(
              "assets/nba.svg",
              fit: BoxFit.contain,
              semanticsLabel: "Logo",
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 51, 138, 209),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_rounded),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games_rounded),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Players',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
