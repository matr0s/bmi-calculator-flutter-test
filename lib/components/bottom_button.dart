import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonLabel, @required this.onPress});
  final String buttonLabel;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonLabel,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
