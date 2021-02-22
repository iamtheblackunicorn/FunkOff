/// This method returns the
/// lexing patterns needed
/// for matching formulas.
Map<String, dynamic> enginePatterns() {
  Map<String, dynamic> patterns = {
    'NUMBER': RegExp(r'[0-9]+\.[0-9]+'),
    'PLUS': RegExp(r'\+'),
    'MINUS': RegExp(r'\-'),
    'TIMES': RegExp(r'\*'),
    'DYNAMIC': RegExp(r'[a-z]'),
    'DIVIDE': RegExp(r'\/'),
    'OPEN_PAREN': RegExp(r'\('),
    'CLOSE_PAREN': RegExp(r'\)')
  };
  return patterns;
}

/// This method returns the
/// AST patterns needed
/// for matching formulas.
Map<String, dynamic> engineAST() {
  Map<String, dynamic> ast = {
    'LINEAR_FUNCTION':
        'NUMBER PLUS OPEN_PAREN NUMBER TIMES DYNAMIC CLOSE_PAREN',
    'QUADRATIC_FUNCTION':
        'NUMBER PLUS OPEN_PAREN NUMBER TIMES DYNAMIC TIMES DYNAMIC CLOSE_PAREN PLUS OPEN_PAREN NUMBER TIMES DYNAMIC CLOSE_PAREN',
    'CUBE_FUNCTION':
        'NUMBER PLUS OPEN_PAREN NUMBER TIMES DYNAMIC TIMES DYNAMIC TIMES DYNAMIC CLOSE_PAREN PLUS OPEN_PAREN NUMBER TIMES DYNAMIC TIMES DYNAMIC CLOSE_PAREN PLUS OPEN_PAREN NUMBER TIMES DYNAMIC CLOSE_PAREN'
  };
  return ast;
}

/// Returns a map of the non-essential parser elements.
Map<String, dynamic> cosmeticStatements() {
  Map<String, dynamic> cosmetics = {
    'PLUS': RegExp(r'\+'),
    'MINUS': RegExp(r'\-'),
    'TIMES': RegExp(r'\*'),
    'DIVIDE': RegExp(r'\/'),
    'OPEN_PAREN': RegExp(r'\('),
    'CLOSE_PAREN': RegExp(r'\)'),
    'DYNAMIC': RegExp(r'[a-z]')
  };
  return cosmetics;
}

/// Generates a list of the schema [TOKEN_TYPE, TOKEN]
/// and returns it.
List<dynamic> patternParser(String formula) {
  Map<String, dynamic> patterns = enginePatterns();
  List<dynamic> resultList = [];
  List<String> tokens = formula.split(' ');
  for (int i = 0; i < tokens.length; i++) {
    for (int x = 0; x < patterns.length; x++) {
      String key = patterns.keys.elementAt(x);
      if (patterns[key].hasMatch(tokens[i]) == true) {
        String match = patterns[key].stringMatch(tokens[i]);
        List<String> imList = [key, match];
        resultList.add(imList);
      } else {}
    }
  }
  return resultList;
}

/// Returns which type of function is being fed in as a string.
String astParser(String formula) {
  Map<String, dynamic> ast = engineAST();
  List<dynamic> parsedTokens = patternParser(formula);
  List<String> tokenList = [];
  String result = 'NONE';
  for (int i = 0; i < parsedTokens.length; i++) {
    tokenList.add(parsedTokens[i][0]);
  }
  for (int x = 0; x < ast.length; x++) {
    String key = ast.keys.elementAt(x);
    if (ast[key] == tokenList.join(' ')) {
      result = key;
      break;
    } else {}
  }
  return result;
}

/// Returns a Boolean value of whether
/// the formula fed-in, is valid.
bool statementLinter(String formula) {
  bool result = false;
  if (astParser(formula) != 'NONE') {
    result = true;
  } else {}
  return result;
}

/// Returns a list of double values,
/// containing, a,b, and c, if present.
List<double> irParser(String formula) {
  List<double> result = [];
  if (astParser(formula) != 'NONE') {
    List<dynamic> parsedTokens = patternParser(formula);
    Map<String, dynamic> cosmetics = cosmeticStatements();
    for (int i = 0; i < parsedTokens.length; i++) {
      for (int x = 0; x < cosmetics.length; x++) {
        String key = cosmetics.keys.elementAt(x);
        if (cosmetics[key].hasMatch(parsedTokens[i][1])) {
          parsedTokens.remove(parsedTokens[i]);
        } else {}
      }
    }
    for (int y = 0; y < parsedTokens.length; y++) {
      if (RegExp(r'[0-9]+\.[0-9]+').hasMatch(parsedTokens[y][1]) == true) {
        result.add(double.parse(parsedTokens[y][1]));
      } else {}
    }
  } else {}
  return result;
}

/// This function logs a visual tree of the
/// formula to the console.
void makeVisualTree(String formula) {
  String spaces = '   ';
  print('\n');
  print('\n');
  print(formula);
  print('$spaces|');
  print('$spaces|');
  for (int i = 0; i < patternParser(formula).length; i++) {
    String tokenType = patternParser(formula)[i][0];
    String token = patternParser(formula)[i][1];
    print('$spaces|');
    print('$spaces--- $tokenType: $token');
  }
  print('\n');
  print('\n');
}

/// Tests the functions above.
void testEngine() {
  String formula = '300.0 + ( 25.0 * t * t ) + ( 24.0 * t )';
  makeVisualTree(formula);
  print(patternParser(formula));
  print(astParser(formula));
}
