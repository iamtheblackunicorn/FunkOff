import 'dart:io';
import 'coreEngine.dart';
import 'cubeFunctions.dart';
import 'quadraticFunctions.dart';
import 'linearFunctions.dart';

/// This function evaluates yValues from given user input
/// of the form [formula=>dataset].
String evaluateIO(String userInput) {
  String result = 'NONE';
  try {
    String formula = userInput.split('=>')[0];
    List<String> stringDataSet = userInput.split('=>')[1].split(' ');
    List<double> dataSet = [];
    for (int i = 0; i < stringDataSet.length; i++) {
      dataSet.add(double.tryParse(stringDataSet[i]));
    }
    if (astParser(formula) == 'LINEAR_FUNCTION') {
      List<double> yValues = computeLinearSet(formula, dataSet);
      result = yValues.join(' ');
    } else if (astParser(formula) == 'QUADRATIC_FUNCTION') {
      List<double> yValues = computeQuadraticSet(formula, dataSet);
      result = yValues.join(' ');
    } else if (astParser(formula) == 'CUBE_FUNCTION') {
      List<double> yValues = computeCubeSet(formula, dataSet);
      result = yValues.join(' ');
    } else {}
  } catch (e) {
    result = 'NONE';
  }
  return result;
}

/// This function check whether the shell input is valid!
bool checkInput(String userInput) {
  bool result = false;
  if (evaluateIO(userInput) == 'NONE') {
  } else {
    result = true;
  }
  return result;
}

/// Provides a small shell for testing functions and datasets!
void functionsShell() {
  String userPrompt = 'shell';
  String actualPrompt = 'f(x)';
  while (userPrompt != 'quit') {
    stdout.write('$actualPrompt: ');
    userPrompt = stdin.readLineSync();
    if (userPrompt == 'quit') {
      exit(0);
    } else if (checkInput(userPrompt) == true) {
      print(evaluateIO(userPrompt));
    } else {
      print('Syntax error!');
    }
  }
}

/// This function processes a script with the ending *.fs.
void evaluateScript(String fileName){
  RegExp fileRegex = RegExp(r'.*\.fs');
  if (fileRegex.hasMatch(fileName) == true){
    List<String> contentList = File(fileName).readAsStringSync().split('\n');
    for (int i = 0; i < contentList.length; i++){
      print(evaluateIO(contentList[i]));
    }
  } else {
    print('No valid file supplied!');
  }

}

/// Tests all of the above!
void testShellFunctions() {
  print(evaluateIO('300.0 + ( 24.0 * a )=>4.2 3.2 4.5 4.6'));
  print(evaluateIO('300.0 + ( 25.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6'));
  print(evaluateIO(
      '300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6'));
  print(evaluateIO('=>'));

  print(checkInput('300.0 + ( 24.0 * a )=>4.2 3.2 4.5 4.6'));
  print(checkInput('300.0 + ( 25.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6'));
  print(checkInput(
      '300.0 + ( 25.0 * t * t * t ) + ( 26.0 * t * t ) + ( 24.0 * t )=>4.2 3.2 4.5 4.6'));
}
