import 'coreEngine.dart';

/// Computes Y from a given X and function formula
/// and returns it as a double for linear functions.
double computeLinear(String formula, double value) {
  double result = 0;
  if (astParser(formula) == 'LINEAR_FUNCTION') {
    double constant = irParser(formula)[0];
    double factor = irParser(formula)[1];
    result = constant + (factor * value);
  } else {}
  return result;
}

/// Computes Ys from a given Xs and function formula
/// and returns it as a List of doubles for linear functions.
List<double> computeLinearSet(String formula, List<double> values) {
  List<double> results = [];
  for (int i = 0; i < values.length; i++) {
    double result = computeLinear(formula, values[i]);
    results.add(result);
  }
  return results;
}

/// Tests the above methods for linear functions.
void testLinears() {
  String testFormulaLinear = '300.0 + ( 25.0 * t )';
  List<double> testSet = [4.5, 4.6, 4.7, 4.8];
  print(patternParser(testFormulaLinear));
  print(astParser(testFormulaLinear));
  print(irParser(testFormulaLinear));
  print(computeLinear(testFormulaLinear, 2));
  print(computeLinearSet(testFormulaLinear, testSet));
}
