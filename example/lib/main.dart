/*
FUNK OFF by Alexander Abraham a.k.a. "The Black Unicorn".
Licensed under the MIT license.
*/

import 'package:funkoff/core/coreEngine.dart'; // If you want to use the engine itself, use this!
import 'package:funkoff/linearFunctions.dart'; // If you want to use linear functions, import this!
import 'package:funkoff/quadraticFunctions.dart'; // If you want to use quadratic functions, import this!
import 'package:funkoff/cubeFunctions.dart'; // If you want to use cube functions, import this!

void main(){

  String linearFunction = '300.0 + ( 25.0 * t )';
  String quadraticFunction = '300.0 + ( 25.0 * t * t ) + ( 24.0 * t )';
  String cubeFunction = '300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )';
  List<double> testSet = [4.5, 4.6, 4.7, 4.8];
  double testX = 2;

  print(patternParser(linearFunction));
  print(astParser(linearFunction));
  print(statementLinter(linearFunction));
  print(irParser(linearFunction));
  makeVisualTree(linearFunction);

  print(patternParser(quadraticFunction));
  print(astParser(quadraticFunction));
  print(statementLinter(quadraticFunction));
  print(irParser(quadraticFunction));
  makeVisualTree(quadraticFunction);

  print(patternParser(cubeFunction));
  print(astParser(cubeFunction));
  print(statementLinter(cubeFunction));
  print(irParser(cubeFunction));
  makeVisualTree(cubeFunction);

  print(computeLinear(linearFormula,testX));
  print(computeQuadratic(quadraticFormula,testX));
  print(computeCube(cubeFormula,testX));

  print(computeLinearSet(linearFormula,testSet));
  print(computeQuadraticSet(quadraticFormula,testSet));
  print(computeCubeSet(cubeFormula,testSet));

  testEngine();
  testCubes();
  testQuadratics();
  testLinears();
}
