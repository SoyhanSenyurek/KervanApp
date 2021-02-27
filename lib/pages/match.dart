import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  List<String> items = ["soyhan", "hasan", "mehmet", "yasin"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Container(
          child: Column(
        children: List.generate(items.length, (index) {
          return ListTile(
            leading: Icon(MdiIcons.account),
            title: Text(items[index]),
            onTap: () {
              Navigator.of(context).pushNamed('/detail');
            },
          );
        }),
      )),
    );
  }
}
