import 'package:flutter/material.dart';
import 'package:nba/src/api/fetch.dart';
import 'package:nba/src/widgets/item.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});
  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getData();
    }
  }

  getData() async {
    data = await fetchData('https://www.balldontlie.io/api/v1/teams');
    setState(() {
      data = data;
    });
  }

  Map<String, dynamic> config = {
    "img": "assets/team.png", 
    "png": true,
    "color":Colors.amber
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
              "name": data[index]["name"],
              "city": data[index]["city"],
              "division": data[index]["division"],
              "conference": data[index]["conference"],
            },
            ["center", "left", "left", "right"]
          ], data[index], config);
        },
      ),
    );
  }
}
