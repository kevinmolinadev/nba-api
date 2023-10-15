import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nba/src/widgets/item_detail.dart';

class Item extends StatefulWidget {
  final Map<String, dynamic> config;
  final List<dynamic> item;
  final Map<String, dynamic> itemDetail;
  const Item(this.item, this.itemDetail, this.config, {super.key});
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  List<Widget> itemsData = [];
  Map<String, Alignment> alignments = {
    "center": Alignment.center,
    "left": Alignment.centerLeft,
    "right": Alignment.centerRight,
  };
  void loadItem(BuildContext context) {
    Map<String, dynamic> data = widget.item[0];
    List<dynamic> options = widget.item[1];
    data.entries.toList().asMap().forEach((index, entry) {
      final dynamic alignmentCustom = alignments[options[index]];
      final attribute = Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
            alignment: alignmentCustom,
            child: index == 0
                ? Text('${entry.value}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
                : Text('${entry.key}: ${entry.value}',
                    style: const TextStyle(fontSize: 18))),
      );
      itemsData.add(attribute);
    });
  }
  void goDetail(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(widget.itemDetail,widget.config)));
  }
  @override
  Widget build(BuildContext context) {
    loadItem(context);
    return GestureDetector(
      onTap: () => goDetail(context),
      child: Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: widget.config['color'],
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
                height: 100,
                child: widget.config['png']
                    ? Image.asset(
                        widget.config['img'],
                        fit: BoxFit.contain,
                      )
                    : SvgPicture.asset(
                        widget.config['img'], // Ruta al archivo SVG
                        fit: BoxFit.contain,
                      )),
            Expanded(
                child: Column(
              children: itemsData,
            ))
          ],
        ),
      ),
    ));
  }
}
