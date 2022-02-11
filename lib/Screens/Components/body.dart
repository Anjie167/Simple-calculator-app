import 'package:calculator/Controller/controller.dart';
import 'package:calculator/Screens/Components/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'button.dart';
import 'calculator_screen.dart';

class Body extends StatefulWidget {


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var equation = '';
  var answer = '0';

  equalPressed() {
    String finalEquation = equation;
    finalEquation = equation.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalEquation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer<Controller>(
      builder: (context, control, child)=>
      SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //ThemeMode button
                  ThemeButton(),
                  CalculatorScreen(equation: equation, answer: answer,),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 420,
              width: double.infinity,
              decoration: BoxDecoration(
                color: control.isThemeWhite? kPrimary : kPrimaryDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: allButtons(),
            ),
          ],
        ),
      ),
    );
  }

  void pressButton(String display){
    if(equation.length < 20){
      setState(() {
        equation += display;
      });
    }
  }

  void replaceEquation(){
    if(answer != '0'){
      equation = answer;
    }
  }

  Table allButtons() {
    return Table(
              children: [
                TableRow(
                  children: [
                    Button(
                      button: 'AC',
                      colour: kTint,
                      press: (){
                        setState(() {
                          equation = '';
                          answer = '0';
                        });
                      },
                    ),
                    Button(
                      button: '+/_',
                      colour: kTint,
                      press: (){
                        replaceEquation();
                        pressButton('+/_');
                      },
                    ),
                    Button(
                      button: '%',
                      colour: kTint,
                      press: (){
                        replaceEquation();
                        pressButton('%');
                      },
                    ),
                    Button(
                      button: '/',
                      colour: kRed,
                      press: (){
                        replaceEquation();
                        pressButton('/');
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Button(
                      button: '7',
                      press: (){
                        pressButton('7');
                      },
                    ),
                    Button(
                      button: '8',
                      press: (){
                        pressButton('8');
                      },
                    ),
                    Button(
                      button: '9',
                      press: (){
                        pressButton('9');
                      },
                    ),
                    Button(
                      button: 'X',
                      colour: kRed,
                      press: (){
                        replaceEquation();
                        pressButton('*');
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Button(
                      button: '4',
                      press: (){
                        pressButton('4');
                      },
                    ),
                    Button(
                      button: '5',
                      press: (){
                        pressButton('5');
                      },
                    ),
                    Button(
                      button: '6',
                      press: (){
                        pressButton('6');
                      },
                    ),
                    Button(
                      button: '-',
                      colour: kRed,
                      press: (){
                        replaceEquation();
                        pressButton('-');
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Button(
                      button: '1',
                      press: (){
                        pressButton('1');
                      },
                    ),
                    Button(
                      button: '2',
                      press: (){
                        pressButton('2');
                      },
                    ),
                    Button(
                      button: '3',
                      press: (){
                        pressButton('3');
                      },
                    ),
                    Button(
                      button: '+',
                      colour: kRed,
                      press: (){
                        replaceEquation();
                        pressButton('+');
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Button(
                      button: 'DEL',
                      press: (){
                        setState(() {
                          if (equation.length > 0)
                          equation = equation.substring(0, equation.length - 1);
                        });
                      },
                    ),
                    Button(
                      button: '0',
                      press: (){
                        pressButton('0');
                      },
                    ),
                    Button(
                      button: '.',
                      press: (){
                        pressButton('.');
                      },
                    ),
                    Button(
                      button: '=',
                      colour: kRed,
                      press: (){
                        setState(() {
                          equalPressed();
                        });
                      },
                    ),
                  ],
                ),
              ],
            );
  }
}

