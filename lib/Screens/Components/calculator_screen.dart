import 'package:calculator/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({
    Key key, this.equation, this.answer,
  }) : super(key: key);

  final String equation, answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    equation,
                    style: TextStyle(
                        color: Provider.of<Controller>(context).isThemeWhite ? Colors.black : Colors.white,
                        fontSize: 23, fontWeight: FontWeight.w500),
                  )
                ),
                SizedBox(width: 20,)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    answer,
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
