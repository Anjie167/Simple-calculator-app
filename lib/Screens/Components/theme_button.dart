import 'package:calculator/Controller/controller.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({
    Key key,
  }) : super(key: key);


  @override
  _ThemeButtonState createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, control, child) =>
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: control.isThemeWhite ? kUnder : kPrimaryDark,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    control.updateTheme();
                  });
                },
                icon: Icon(
                  Icons.wb_sunny,
                  size: control.isThemeWhite ?  30 : 24,
                  color: control.isThemeWhite ? Colors.black12 : Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
