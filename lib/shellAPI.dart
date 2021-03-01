import 'dart:io';
import 'cubeFunctions.dart';
import 'quadraticFunctions.dart';
import 'linearFunctions.dart';

/// This function evaluates yValues from given user input
/// of the form [formula=>dataset].
String evaluateIO(String userInput){
  String formula = userInput.split('=>')[0];
  List<String> stringDataSet = userInput.split('=>')[1].split(' ');
  List<double> dataSet = [];
  String result = 'NONE';
  for (int i = 0; i < stringDataSet.length; i++){
    dataSet.add(double.parse(stringDataSet[i]));
  }
  if (astParser(formula) == 'LINEAR_FUNCTION'){
    List<double> yValues = computeLinearSet(formula, dataSet);
    result = yValues.join(' ');
  }
  else if (astParser(formula) == 'QUADRATIC_FUNCTION'){
    List<double> yValues = computeQuadraticSet(formula, dataSet);
    result = yValues.join(' ');
  }
  else if (astParser(formula) == 'CUBE_FUNCTION'){
    List<double> yValues = computeCubeSet(formula, dataSet);
    result = yValues.join(' ');
  }
  else {}
  return result;
}

/// This function check whether the shell input is valid!
bool checkInput(String userInput) {
  bool result = false;
  if (evaluateIO(userInput) == 'NONE'){}
  else {
    result = true;
  }
  return result;
}

/// Provides a small shell for testing functions and datasets!
void functionsShell(){
  String userPrompt = 'shell';
  String actualPrompt = 'f(x)';
  while (userPrompt != 'quit'){
    stdout.write('$actualPrompt: ');
    userPrompt = stdin.readLineSync();
    if (userPrompt == 'quit') {
      exit(0);
    }

    else {
      print(evaluateIO(userPrompt));
    }
  }
}
