import 'coreEngine.dart';
import 'dart:math';

double computeCube(String formula, double value) {
  double result = 0;
  if (astParser(formula) == 'CUBE_FUNCTION') {
    double constant = irParser(formula)[0];
    double factorToBeCubed = irParser(formula)[1];
    double factorToBeSquared = irParser(formula)[2];
    double factorToBeMultiplied = irParser(formula)[3];
    result = constant +
        (factorToBeCubed * pow(value, 3)) +
        (factorToBeSquared * pow(value, 2)) +
        (factorToBeMultiplied * value);
  } else {}
  return result;
}

List<double> computeCubeSet(String formula, List<double> values) {
  List<double> results = [];
  for (int i = 0; i < values.length; i++) {
    double result = computeCube(formula, values[i]);
    results.add(result);
  }
  return results;
}

void testCubes() {
  String testFormulaCube =
      '300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )';
  List<double> testSet = [4.5, 4.6, 4.7, 4.8];
  print(patternParser(testFormulaCube));
  print(astParser(testFormulaCube));
  print(irParser(testFormulaCube));
  print(computeCube(testFormulaCube, 2));
  print(computeCubeSet(testFormulaCube, testSet));
}

void main() {
  testCubes();
}
