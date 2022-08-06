import 'package:flutter/material.dart';
import 'package:rafiki2/components/activity_card.dart';
import 'package:rafiki2/styles.dart';

class Emotions extends StatefulWidget {
  const Emotions({Key? key}) : super(key: key);

  @override
  State<Emotions> createState() => _EmotionsState();
}

class _EmotionsState extends State<Emotions> {
  List _emotions = [
    "Happy",
    "Excited",
    "Content",
    "Grateful",
    "Confused",
    "Anxious",
    "Worried",
    "Sad",
    "Depressed",
    "Lonely"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GridView.builder(
        itemCount: _emotions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return ActivityCard(label: _emotions[index]);
        },
      ),
    );
  }
}
