import 'package:flutter/material.dart';
import 'package:rafiki2/body_parts.dart';
import 'package:rafiki2/emotions.dart';
import 'package:rafiki2/food.dart';
import 'package:rafiki2/pain_rate.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blueGrey
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/bodyParts': (context) => BodyParts(),
        '/painRate': (context) => const PainRate(),
        '/food':(context) => const Food(),
        '/emotions': ((context) => const Emotions())
      },
    );
  }
}

