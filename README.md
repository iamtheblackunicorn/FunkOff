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
  funkoff: ^1.2.0-nullsafety.0
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
Generates a list of the schema `TOKEN_TYPE, TOKEN` and returns it.

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

## Note :scroll:

- *Funk Off* by Alexander Abraham a.k.a. *The Black Unicorn*
- licensed under the MIT license
