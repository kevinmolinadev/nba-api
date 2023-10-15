import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDetail extends StatelessWidget {
  final Map<String, dynamic> item;
  final Map<String, dynamic> config;
  const ItemDetail(this.item, this.config, {super.key});
  List<Widget> items(Map<String, dynamic> map) {
    List<Widget> data = [];
    List<Widget> extraData = [];
    String titleExtra = "";
    void convertToWidget(Map<String, dynamic> map, bool isExtraData) {
      List<Widget> extraDataTemp = [];
      final title = Align(
        alignment: Alignment.center,
        child: Text(titleExtra,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      );
      extraDataTemp.add(title);
      map.forEach((key, value) {
        if (value is Map) {
          titleExtra = key;
          convertToWidget(Map.from(value), true);
        } else {
          final item = Text("$key: $value",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: isExtraData ? 16 : 18));
          isExtraData ? extraDataTemp.add(item) : data.add(item);
        }
      });
      if (isExtraData) {
        final card = Expanded(
            child: Card(
                color: Colors.grey[300],
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: extraDataTemp),
                )));
        extraData.add(card);
      }
    }

    convertToWidget(map, false);
    final row = Row(children: extraData);
    data.add(row);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: config["color"],
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                        width: 180,
                        height: 180,
                        child: config['png']
                            ? Image.asset(
                                config['img'],
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                config['img'], // Ruta al archivo SVG
                                fit: BoxFit.contain,
                              ))),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items(item),
                    ))
              ],
            ),
          ),
        ));
  }
}
