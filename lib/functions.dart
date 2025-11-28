import 'package:calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
class Functions {
static String input = "";
static bool isOperand=false;
static bool dot=false;
static void append(String s, Function setState) {
setState(() {
  input=Buttons.numbers.contains(s) ?input+s:Buttons.operators.contains(s)&& !isOperand?input+s:input;

if(Buttons.operators.contains(s)){
 if(!isOperand){
     isOperand=true;
     dot=false;
  }
}
if(Buttons.numbers.contains(s)) {
  isOperand=false; }
  switch(s){
    case "AC": {
      input = "";
      dot=false;
      isOperand=false;
      break;
    }
    case "⌫": {
      input=input.substring(0,input.length-1);
  }
  case".":{
    String currentNumber = _getCurrentNumber(input);
          if (currentNumber.contains(".")) {
            return;
          }
   if(input.isEmpty){
    input+="0.";
    dot=true;
   }
   else{
    input+=".";
    dot=true;
   }
  }
  case"=":{
     if(input.isNotEmpty){
   input= calculate(input);
  }}
}
});
}
static String _getCurrentNumber(String input) {
    if (input.isEmpty) return "";
    int lastOperatorIndex = -1;
    for (int i = input.length - 1; i >= 0; i--) {
      if (Buttons.operators.contains(input[i])) {
        lastOperatorIndex = i;
        break;
      }
    }
    return input.substring(lastOperatorIndex + 1);
  }

static String calculate(String expression){
  expression = expression.replaceAll('x', '*');
  ExpressionParser ep= GrammarParser();
  ContextModel contextModel= ContextModel();
  Expression exp=ep.parse(expression);

  // ignore: deprecated_member_use
  double result=exp.evaluate(EvaluationType.REAL,contextModel);
  return result.toString();
}

}