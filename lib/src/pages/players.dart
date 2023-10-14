import 'package:flutter/material.dart';
import 'package:nba/src/api/fetch.dart';
import 'package:nba/src/widgets/item.dart';

class Players extends StatefulWidget {
  const Players({super.key});
  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getData();
    }
  }

  getData() async {
    data = await fetchData('https://www.balldontlie.io/api/v1/players');
    setState(() {
      data = data;
    });
  }

  Map<String, dynamic> config = {
    "img": "assets/player.png", 
    "png": true,
    "color":Colors.green
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Item([
            {
              "first_name": data[index]["first_name"],
              "last_name": data[index]["last_name"],
              "position": data[index]["position"],
              "team": data[index]["team"]["name"],
            },
            const ["center", "left", "left", "left"]
          ], data[index], config);
        },
      ),
    );
  }
}
