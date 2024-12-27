import 'package:exptracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Color(0xff00b2e7),
          secondary: Color(0xffe064f7),
          tertiary: Color(0xffff8d6c),
          outline: Colors.grey,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
