import 'package:flutter/material.dart';
import 'package:letItGrow/src/ui/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let IT Grow',
      home: CustomBottomNavigation(),
    );
  }
}
