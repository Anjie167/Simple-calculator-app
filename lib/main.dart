import 'package:calculator/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller(),
      child: Consumer<Controller>(
        builder: (context, control, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF15181e),),
          theme: ThemeData.light(),
          themeMode: control.isThemeWhite ? ThemeMode.light : ThemeMode.dark,
          home: HomeScreen(),
        ),
      ),
    );
  }
}

