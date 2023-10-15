import 'package:flutter/material.dart';
import 'package:nba/src/api/fetch.dart';
import 'package:nba/src/widgets/item.dart';
import 'package:nba/src/widgets/load.dart';

class Games extends StatefulWidget {
  const Games({super.key});
  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getData();
    }
  }

  getData() async {
    data = await fetchData('https://www.balldontlie.io/api/v1/games');
    setState(() {
      data = data;
    });
  }

  Map<String, dynamic> config = {
    "img": "assets/game.svg",
    "png": false,
    "color": Colors.red
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: data.isEmpty
          ? const Load()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Item([
                  {
                    "match":
                        "${data[index]["home_team"]["name"].toString().toUpperCase()} vs ${data[index]["visitor_team"]["name"].toString().toUpperCase()}",
                    "season": data[index]["season"],
                    "status": data[index]["status"],
                  },
                  const ["right", "left", "left", "left"]
                ], {...data[index],"date":data[index]["date"].toString().split("T")[0]}, config);
              },
            ),
    );
  }
}
