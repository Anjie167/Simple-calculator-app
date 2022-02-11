import 'package:calculator/Controller/controller.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,@required this.button, this.colour , this.press,
  }) : super(key: key);

  final String button;
  final Color colour;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 20.0, top: 20,),
        height: 60,
        width: 60,
        child:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            button,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colour,
                fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        decoration: BoxDecoration(
            color: Provider.of<Controller>(context).isThemeWhite ? kUnder : kUnderDark,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
