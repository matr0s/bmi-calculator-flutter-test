import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'reusable_card_child.dart';

// CONST VAR HERE

enum GenderType { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 176;
  int weight = 80;
  int age = 38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                    ? kActiveCardColour
                    : kInactiveCardColour,
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
                    ? kActiveCardColour
                    : kInactiveCardColour,
                cardChild: ReusableCardChild(
                    childIcon: FontAwesomeIcons.venus, childLabel: 'FEMALE'),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(height.toString(), style: kNumTextStyle),
                    Text(
                      ' cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double sliderValue) {
                      setState(() {
                        height = sliderValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          weight.toString(),
                          style: kNumTextStyle,
                        ),
                        Text(' kg', style: kLabelStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          iconType: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 15.0),
                        RoundIconButton(
                          iconType: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumTextStyle,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                        iconType: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(width: 15.0),
                      RoundIconButton(
                        iconType: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ]),
        ),
        Container(
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          height: kBottomContainerHeight,
          width: double.infinity,
        ),
      ]),
    );
  }
}

// MY own widget for the + & - buttons
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconType, @required this.onPressed});
  final IconData iconType;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0x298D8E98),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 6.0,
      onPressed: onPressed,
      child: Icon(iconType),
    );
  }
}
