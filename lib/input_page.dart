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
  GenderType selectedGender;

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
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderType.male;
                  });
                },
                colour: selectedGender == GenderType.male
                    ? activeCardColour
                    : inactiveCardColour,
                cardChild: ReusableCardChild(
                    childIcon: FontAwesomeIcons.mars, childLabel: 'MALE'),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderType.female;
                  });
                },
                colour: selectedGender == GenderType.female
                    ? activeCardColour
                    : inactiveCardColour,
                cardChild: ReusableCardChild(
                    childIcon: FontAwesomeIcons.venus, childLabel: 'FEMALE'),
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
