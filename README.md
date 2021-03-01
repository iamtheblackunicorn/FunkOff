# FUNK OFF :chart_with_upwards_trend:

[![Build Status](https://travis-ci.com/iamtheblackunicorn/FunkOff.svg?branch=main)](https://travis-ci.com/iamtheblackunicorn/FunkOff)

*An over-powered engine to evaluate mathematical graph functions.* :chart_with_upwards_trend:

## About :books:

The other day, I wanted to compute a number of values for a function formula. I wondered how I could implement a function that handles cubes, squares and linear functions fed into a function as a string and produce a list of values as Ys from a given list of Xs. *Funk Off* is that library. It supports linear functions, quadratic functions and cubic functions!

## Installation :inbox_tray:

### Adding to your project

To add *Funk Off* to your project's dependencies, add this line to your project's `pubspec.yaml`:

#### From *GitHub*

```YAML
depdencies:
  ...
  funkoff:
    git: git://github.com/iamtheblackunicorn/FunkOff.git
```

#### From *Pub.dev*

```YAML
depdencies:
  ...
  funkoff: ^1.1.0
```

### Using the binary

Run this command to install *Funk Off*:

```bash
$ dart pub global activate funkoff
```

The three dots represent anything else that you might have in the `dependencies` section. Having done that, re-fetch your project's dependencies by running this in the project's root directory:

```bash
$ dart pub get
```

## Usage :hammer:

### Importing

Import the engine-API like this:

```dart
import 'package:funkoff/funkoff.dart';
```

### API

#### Engine API

##### Map<String, dynamic> enginePatterns()
This method returns the lexing patterns needed for matching formulas.

##### Map<String, dynamic> engineAST()
This method returns the AST patterns needed for matching formulas.

##### Map<String, dynamic> cosmeticStatements()
Returns a map of the non-essential parser elements.

##### List<dynamic> patternParser(String formula)
Generates a list of the schema `TOKEN_TYPE, TOKEN and returns it.

##### String astParser(String formula)
Returns which type of function is being fed in as a string.

##### bool statementLinter(String formula)
Returns a Boolean value of whether the formula fed-in, is valid.

##### List<double> irParser(String formula)
Returns a list of double values, containing, a,b, and c, if present.

##### void makeVisualTree(String formula)
This function logs a visual tree of the formula to the console.

##### void testEngine()
Tests the functions above.

#### Linear Functions API

##### double computeLinear(String formula, double value)
Computes Y from a given X and function formula and returns it as a double for linear functions.

##### List<double> computeLinearSet(String formula, List<double> values)
Computes Ys from a given Xs and function formula and returns it as a List of doubles for linear functions.

##### void testLinears()
Tests the above methods for linear functions.

#### Quadratic Functions API

##### double computeQuadratic(String formula, double value)
Computes Y from a given X and function formula and returns it as a double for quadratic functions.

##### List<double> computeQuadraticSet(String formula, List<double> values)
Computes Ys from a given Xs and function formula and returns it as a List of doubles for quadratic functions.

##### void testQuadratics()
Tests the above methods for quadratic functions.

#### Cube Functions API

##### double computeCube(String formula, double value)
Computes Y from a given X and function formula and returns it as a double for cubic functions.

##### List<double> computeCubeSet(String formula, List<double> values)
Computes Ys from a given Xs and function formula and returns it as a List of doubles for cubic functions.

##### void testCubes()
Tests the above methods for cubic functions.

#### Shell API

##### String evaluateIO(String userInput)
This function evaluates yValues from given user input of the form `formula=>dataset`.

##### bool checkInput(String userInput)
This function check whether the shell input is valid!

##### void functionsShell()
Provides a small shell for testing functions and datasets!

#### Shell

*FunkOff* now has a shell in which you can test functions.
Call it by typing this command `funkoff`.

You can get given Y-values from X-values like this:

```text
# Linear functions
300.0 + ( 24.0 * a )=>4.2 3.2 4.5 4.6

# Quadratic functions
300.0 + ( 25.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6

# Cube functions
300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6
```

## Example :calling:

This is what a minimal example using *Funk Off* would look like.

```dart
/*
FUNK OFF by Alexander Abraham a.k.a. "The Black Unicorn".
Licensed under the MIT license.
*/

import 'package:funkoff/funkoff.dart'; // If you want to use the engine itself, use this!

void main() {
  String linearFunction = '300.0 + ( 25.0 * t )';
  String quadraticFunction = '300.0 + ( 25.0 * t * t ) + ( 24.0 * t )';
  String cubeFunction =
      '300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )';
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

  print(computeLinear(linearFunction, testX));
  print(computeQuadratic(quadraticFunction, testX));
  print(computeCube(cubeFunction, testX));

  print(computeLinearSet(linearFunction, testSet));
  print(computeQuadraticSet(quadraticFunction, testSet));
  print(computeCubeSet(cubeFunction, testSet));

  testEngine();
  testCubes();
  testQuadratics();
  testLinears();
  testShellFunctions();
}
```
## Note :scroll:

- *Funk Off* by Alexander Abraham a.k.a. *The Black Unicorn*
- licensed under the MIT license
