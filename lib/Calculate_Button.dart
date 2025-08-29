import 'package:flutter/material.dart';
import 'package:storyboss/Constants.dart';
import 'results_page.dart';
class BottomButton extends StatelessWidget {
  BottomButton({ required this.buttonTitle, required this.onTap});
final Function onTap;
final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(buttonTitle, style: klargeTextButtonStyle),
        ),
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}