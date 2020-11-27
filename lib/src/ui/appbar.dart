import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading, String heading})
      : super(
            key: key,
            title: title,
            leading: leading,
            backgroundColor: Color(0xff36e3c7),
            centerTitle: true,
            automaticallyImplyLeading: false,
            // bottom: PreferredSize(
            //     child: Container(), preferredSize: Size.fromHeight(0.5)),
            actions: <Widget>[]);
}
