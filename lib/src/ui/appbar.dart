import 'package:flutter/material.dart';
import 'package:letItGrow/src/ui/drawer.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading, String heading})
      : super(
            key: key,
            title: title,
            leading: leading,
            backgroundColor: Color(0xff116466).withOpacity(0.7),
            centerTitle: true,

            // bottom: PreferredSize(
            //     child: Container(), preferredSize: Size.fromHeight(0.5)),
            actions: <Widget>[]);
}
