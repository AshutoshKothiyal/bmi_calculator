import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  @override
  final IconData icon;
  final String label;

  const IconContent({required this.icon,required this.label});
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label, style: TextStyle(
          fontSize: 18.0, color: Color(0XFF8D8E98),
          fontWeight: FontWeight.bold,
        ),),
      ],
    );
  }
}