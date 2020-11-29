import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';

class ServicesPage extends StatefulWidget with NavigationStates {
  ServicesPage({Key key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('This is service page.')),
    );
  }
}
