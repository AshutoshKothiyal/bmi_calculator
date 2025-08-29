import 'package:flutter/material.dart';
import 'package:storyboss/Cards.dart';
import 'package:storyboss/Constants.dart';
import 'package:storyboss/iconcontents.dart';
import 'package:storyboss/Calculate_Button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storyboss/main.dart';
import 'results_page.dart';
import 'package:storyboss/BMICalculate.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputpageState();
}

class _InputpageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 18;
  Color MaleCardColor = kInactiveCardColor;
  Color FemaleCardColor = kInactiveCardColor;
  Gender? Selectedgender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Selectedgender = Gender.male;
                        },
                      );
                    },
                    child: ReusableCard(
                      c: Selectedgender == Gender.male
                          ? kReusableCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Selectedgender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      c: Selectedgender == Gender.female
                          ? kReusableCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              c: kReusableCardColor,
              cardChild: Column(
                children: [
                  Text("Height", style: klabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white54,
                      inactiveTrackColor: Color(0x158D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0x158D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      c: Color(0xFF1D1E33),
                      cardChild: Column(
                        children: [
                          Text(
                            "Weight",
                            style: klabelTextStyle,
                          ),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if(weight>0) {
                                      weight--;
                                    }                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if(weight>0|| weight==0) {
                                      weight++;
                                    }

                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      c: Color(0xFF1D1E33),
                      cardChild: Column(
                        children: [
                          Text(
                            "Age",
                            style: klabelTextStyle,
                          ),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if(age>0)
                                      {
                                        age--;
                                      }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    if(age>0 || age==0)
                                    {
                                      age++;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          BottomButton(buttonTitle: "Calculate", onTap: (){
          Calculator calc= Calculator(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (contex)=> ResultsPage(
              bmiResults: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretationText: calc.getInterpretation(),

            ),),);
          },),




        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 9,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Colors.lightBlueAccent,
      onPressed: onPressed,
    );
  }
}


