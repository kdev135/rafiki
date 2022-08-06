import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rafiki2/styles.dart';

class ActivityCard extends StatefulWidget {
 

  final String label;
  final Function? action;

  const ActivityCard({Key? key, required this.label, this.action}) : super(key: key);
//  Activity activity;
  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool selected = false;
  Color shadowColor = Colors.white;

  double _elevation = 0;
  Color cardColor = Colors.white;
  Color svgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action?.call();

        setState(() {
          selected ? shadowColor = Colors.lightBlue : shadowColor = Colors.white;
          selected ? _elevation = 0 : _elevation = 5;
          selected = !selected;
          print(selected);
          selected ? cardColor = Colors.black : cardColor = Colors.white;
          selected ? svgColor = Colors.white : svgColor = Colors.black;
        });

        Timer(const Duration(seconds: 5), (() {
          print("seconds elapsed");
          setState(() {
            selected = false;
            shadowColor = Colors.white;
            cardColor = Colors.white;
            svgColor = Colors.black;
            _elevation = 0;
          });
        }));
      },
      child: Card(
          shadowColor: shadowColor,
          color: cardColor,
          elevation: _elevation,
          child: Center(
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: lableTextStyle.copyWith(color: svgColor),
            ),
          )),
    );
  }
}
