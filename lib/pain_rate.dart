import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafiki2/components/reusable_grid_view.dart';
import 'package:rafiki2/styles.dart';

class PainRate extends StatefulWidget {
  const PainRate({Key? key}) : super(key: key);

  @override
  State<PainRate> createState() => _PainRateState();
}

class _PainRateState extends State<PainRate> {
  Color _cardColor = Colors.white;
  bool _selected = false;
  double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
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
        child: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Card(
                    child: Text(
                      "Select $args pain intensity, 10 being extreme",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                    )),
              ),
             
              ReusableGeneratedGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
