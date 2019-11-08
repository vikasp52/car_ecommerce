import 'package:car_ecommerce/screens/home_screen.dart';
import 'package:car_ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Sell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        textSelectionHandleColor: Colors.black,
      ),
      home: LoginScreen(),
    );
  }
}
