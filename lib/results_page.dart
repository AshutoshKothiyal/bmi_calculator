import 'package:flutter/material.dart';
import 'package:storyboss/Cards.dart';
import 'package:storyboss/Constants.dart';
import 'package:storyboss/Constants.dart';
import 'package:storyboss/inputpage.dart';
import 'package:storyboss/Calculate_Button.dart';

class ResultsPage extends StatelessWidget {
  @override
  ResultsPage({required this.bmiResults, required this.resultText, required this.interpretationText});
  late final String bmiResults;
  late final String resultText;
  late final String interpretationText;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text("Your Result", style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                c: kReusableCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: kResultTextStyle,
                    ),
                    Text(bmiResults,style: kBMITextstyle),
                    Text(interpretationText,
                        style: kBMILastTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),),
          ),
         BottomButton(
           buttonTitle: "Re-Calculate", onTap: (){
             Navigator.pop(context);
         },
         ),
        ],
      ),

    );
  }
}
