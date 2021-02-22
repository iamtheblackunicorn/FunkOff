import 'funkoff.dart';
import 'dart:math';

/// Computes Y from a given X and function formula
/// and returns it as a double for quadratic functions.
double computeQuadratic(String formula, double value) {
  double result = 0;
  if (astParser(formula) == 'QUADRATIC_FUNCTION') {
    double constant = irParser(formula)[0];
    double factorToBeSquared = irParser(formula)[1];
    double factorToBeMultiplied = irParser(formula)[2];
    result = constant +
        (factorToBeSquared * pow(value, 2)) +
        (factorToBeMultiplied * value);
  } else {}
  return result;
}

/// Computes Ys from a given Xs and function formula
/// and returns it as a List of doubles for quadratic functions.
List<double> computeQuadraticSet(String formula, List<double> values) {
  List<double> results = [];
  for (int i = 0; i < values.length; i++) {
    double result = computeQuadratic(formula, values[i]);
    results.add(result);
  }
  return results;
}

/// Tests the above methods for quadratic functions.
void testQuadratics() {
  String testFormulaQuadratic = '300.0 + ( 25.0 * t * t ) + ( 24.0 * t )';
  List<double> testSet = [4.5, 4.6, 4.7, 4.8];
  print(patternParser(testFormulaQuadratic));
  print(astParser(testFormulaQuadratic));
  print(irParser(testFormulaQuadratic));
  print(computeQuadratic(testFormulaQuadratic, 2));
  print(computeQuadraticSet(testFormulaQuadratic, testSet));
}

void main() {
  testQuadratic();
}
