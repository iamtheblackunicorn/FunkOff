# EXAMPLE FOR FUNK OFF!

## Example's `pubspec.yaml`:

```YAML
name: test
description: A test app for FunkOff!
version: 1.0.0
homepage: https://github.com/iamtheblackunicorn/FunkOff
environment:
  sdk: '>=2.10.0 <3.0.0'
dependencies:
  funkoff:
    git: git://github.com/iamtheblackunicorn/FunkOff.git
```

## Example app:
This is what an example would look like for FunkOff:

```dart
/*
FUNK OFF by Alexander Abraham a.k.a. "The Black Unicorn".
Licensed under the MIT license.
*/

import 'package:funkoff/funkoff.dart'; // If you want to use the engine itself, use this!

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

  print(computeLinear(linearFunction,testX));
  print(computeQuadratic(quadraticFunction,testX));
  print(computeCube(cubeFunction,testX));

  print(computeLinearSet(linearFunction,testSet));
  print(computeQuadraticSet(quadraticFunction,testSet));
  print(computeCubeSet(cubeFunction,testSet));

  testEngine();
  testCubes();
  testQuadratics();
  testLinears();
  testShellFunctions();
}
```
