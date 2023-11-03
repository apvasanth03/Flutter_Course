import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  late double _bmi;

  CalculatorBrain({required this.weight, required this.height});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight, Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, Good job!';
    } else {
      return 'You have lower than normal body weight, You can eat a bit more';
    }
  }
}
