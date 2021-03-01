import 'package:funkoff/funkoff.dart';

void main(List<String> arguments) {
  if (arguments[0] == 'shell') {
    functionsShell();
  } else {
    try {
      evaluateScript(arguments[0]);
    } catch (e) {
      print('An error occurred!');
    }
  }
}
