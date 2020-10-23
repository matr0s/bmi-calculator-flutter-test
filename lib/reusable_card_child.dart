import 'package:flutter/material.dart';

const labelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild({this.childIcon, this.childLabel});
  final IconData childIcon;
  final String childLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(childIcon, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childLabel,
          style: labelStyle,
        ),
      ],
    );
  }
}
