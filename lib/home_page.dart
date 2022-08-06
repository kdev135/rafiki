import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafiki2/body_parts.dart';
import 'package:rafiki2/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logo = SvgPicture.asset(
    color: Colors.white,
    width: 50,
    height:30,
    "images/rafiki_logo.svg"
  );
  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BodyParts()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
          title: Center(
              child: logo),
        ),
        body: GridView.count(crossAxisCount: 3, children: [
          const ActivityCard(
            label: "Icline bed",
            graphic: "images/Sitting.svg",
          ),
          const ActivityCard(
            label: "Lay down",
            graphic: "images/Laydown.svg",
          ),
          const ActivityCard(
            label: "Sit up",
            graphic: "images/Sitting.svg",
          ),
          const ActivityCard(label: "Medicine", graphic: "images/Medicine.svg"),
          const ActivityCard(
            label: "Nurse or Doctor",
            graphic: "images/Nurse.svg",
          ),
          ActivityCard(label: "In pain", graphic: "images/Pain.svg", action: () => navigate()),
          ActivityCard(
            label: "Food/ Drink",
            graphic: "images/Drink.svg",
            action: () => Navigator.pushNamed(context, "/food"),
          ),
          const ActivityCard(label: "Tv", graphic: "images/TV.svg"),
          const ActivityCard(label: "Bath", graphic: "images/Bath.svg"),
          const ActivityCard(label: "Change Bed", graphic: "images/Toilet_Paper.svg"),
          ActivityCard(
            label: "Emotions",
            graphic: "images/Emotions.svg",
            action: () => Navigator.pushNamed(context, "/emotions"),
          )
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    ActivityCard;
  }
}

class ActivityCard extends StatefulWidget {
  final String graphic;

  final String label;
  final VoidCallback? action;

  const ActivityCard({Key? key, required this.label, required this.graphic, this.action}) : super(key: key);
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
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.graphic,
                  color: svgColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.label,
                  style: lableTextStyle.copyWith(color: svgColor),
                )
              ],
            ),
          )),
    );
  }
}
