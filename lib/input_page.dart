import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_card_child.dart';

// CONST VAR HERE
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColour = Color(0xff1d1e33);
const inactiveCardColour = Color(0xff111328);

enum GenderType { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;

  void updateColour(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColor == inactiveCardColour) {
        maleCardColor = activeCardColour;
        femaleCardColor = inactiveCardColour;
      } else
        maleCardColor = inactiveCardColour;
    }
    if (gender == GenderType.female) {
      if (femaleCardColor == inactiveCardColour) {
        femaleCardColor = activeCardColour;
        maleCardColor = inactiveCardColour;
      } else
        femaleCardColor = inactiveCardColour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(GenderType.male);
                  });
                },
                child: ReusableCard(
                  colour: maleCardColor,
                  cardChild: ReusableCardChild(
                      childIcon: FontAwesomeIcons.mars, childLabel: 'MALE'),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(GenderType.female);
                  });
                },
                child: ReusableCard(
                  colour: femaleCardColor,
                  cardChild: ReusableCardChild(
                      childIcon: FontAwesomeIcons.venus, childLabel: 'FEMALE'),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Expanded(child: ReusableCard(colour: activeCardColour)),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Expanded(child: ReusableCard(colour: activeCardColour)),
            Expanded(child: ReusableCard(colour: activeCardColour)),
          ]),
        ),
        Container(
          color: bottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          height: bottomContainerHeight,
          width: double.infinity,
        ),
      ]),
    );
  }
}
