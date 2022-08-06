import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rafiki2/components/activity_card.dart';
import 'package:rafiki2/styles.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List foods = [
    "I need food",
    "Water",
    "Ginger ale",
    "Coffee",
    "Mashed potatoes",
    "Meatloaf",
    "Pudding",
    "Eggs",
    "Fruit",
    "Fruit salad"
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
        itemCount: foods.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return ActivityCard(label: foods[index]);
        },
      ),
    );
  }
}


