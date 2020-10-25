import 'package:flutter/material.dart';

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
