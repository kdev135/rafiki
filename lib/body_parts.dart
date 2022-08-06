import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafiki2/styles.dart';

class BodyParts extends StatelessWidget {
  BodyParts({Key? key}) : super(key: key);
  List parts = ["Head", "Mouth", "Arm", "Chest", "Stomach", "Back", "Legs", "Feet", "Skin", "Eyes", "Shoulder"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
                  title: Card(
                      child: Text(
                        "Select the body part that is in pain",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                      )),
                ),
            SizedBox(height: 05,),
            ReusableBuilderGridView(parts: parts),
          ],
        ),
      ),
    );
  }
}

class ReusableBuilderGridView extends StatelessWidget {
  const ReusableBuilderGridView({
    Key? key,
    required this.parts,
  }) : super(key: key);

  final List parts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: parts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, "/painRate", arguments: [parts[index]]);
          }),
          child: Card(
            child: Center(
              child: Text(
                parts[index],
                style: lableTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
