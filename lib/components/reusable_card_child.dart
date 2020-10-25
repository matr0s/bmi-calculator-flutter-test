import 'package:flutter/material.dart';
import '../constants.dart';

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
          style: kLabelStyle,
        ),
      ],
    );
  }
}
