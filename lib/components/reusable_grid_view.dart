import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rafiki2/styles.dart';

class ReusableGeneratedGridView extends StatelessWidget {
  var cardText;

  ReusableGeneratedGridView({Key? key, this.cardText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView(shrinkWrap: true, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      
    
          // Generate 10 widgets that display their index in the RateCard
          children: [
            for (int i = 1; i < 11; i++)
              RateCard(
                number: i,
                selectedColor: i < 5 ? Color.fromARGB(255, 235, 138, 138) : Colors.red.shade700,
              )
          ]),
    );
  }
}

class RateCard extends StatefulWidget {
  var number;
  Color selectedColor;

  RateCard({Key? key, required this.number, required this.selectedColor}) : super(key: key);

  @override
  State<RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  Color _cardColor = Colors.white;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          _selected = !_selected;
          _selected ? _cardColor = widget.selectedColor : _cardColor = Colors.white;
        });
        Timer(Duration(seconds: 3), () {
          setState(() {
            _selected = false;
            _cardColor = Colors.white;
          });
        });
      }),
      child: Card(
        color: _cardColor,
        elevation: _selected ? 5 : 0,
        child: Center(
            child: Text(
          '${widget.number}',
          style: lableTextStyle.copyWith(color: _selected ? Color.fromARGB(255, 53, 52, 52): Colors.black),
        )),
      ),
    );
  }
}
