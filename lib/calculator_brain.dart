import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMINumber() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTextBmiResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiResultExplanation() {
    if (_bmi >= 25.0) {
      return 'Stop eating';
    } else if (_bmi > 18.5) {
      return 'You are rock';
    } else {
      return 'Eat more Bro';
    }
  }
}
