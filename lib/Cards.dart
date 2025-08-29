import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.c,required this.cardChild});
  final Color c;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}