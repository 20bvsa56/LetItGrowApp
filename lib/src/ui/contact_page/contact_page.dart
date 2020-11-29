import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/appbar.dart';
import 'package:letItGrow/src/ui/drawer.dart';
import 'package:letItGrow/src/ui/show_up.dart';

class ContactPage extends StatefulWidget with NavigationStates {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int delayAmount = 300;

  List<BoxShadow> shadow = [
    BoxShadow(
        color: Colors.grey[600].withOpacity(0.2),
        blurRadius: 2,
        offset: Offset(4, 4))
  ];
  @override
  Widget build(BuildContext context) {
    final maxLines = 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: Text('Contact',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  fontWeight: FontWeight.w600)),
        ),
        drawer: drawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        boxShadow: shadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(children: [
                      TextField(
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              color: Colors.white),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                                color: Colors.redAccent),
                            suffixIcon: Icon(Icons.person,
                                color: Colors.black54, size: 20),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54,
                                  width: SizeConfig.safeBlockHorizontal / 5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                      TextField(
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              color: Colors.black54),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                                color: Colors.redAccent),
                            suffixIcon: Icon(Icons.email,
                                color: Colors.black54, size: 20),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54,
                                  width: SizeConfig.safeBlockHorizontal / 5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                      TextField(
                          maxLines: maxLines,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              color: Colors.black54),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                                color: Colors.redAccent),
                            suffixIcon: Icon(Icons.message,
                                color: Colors.black54, size: 20),
                            labelText: 'Message',
                            labelStyle: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4,
                                color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54,
                                  width: SizeConfig.safeBlockHorizontal / 5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff116466).withOpacity(0.7)),
                        child: Text(
                          'Send',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal * 5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      circularFroastedContainer(IconShowUp(
                          delay: delayAmount,
                          child: Image.asset('lib/src/images/facebook.png'))),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 2.5),
                      circularFroastedContainer(
                        IconShowUp(
                            delay: delayAmount + 200,
                            child: Image.asset('lib/src/images/instagram.png')),
                      ),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 2.5),
                      circularFroastedContainer(
                        IconShowUp(
                            delay: delayAmount + 400,
                            child: Image.asset('lib/src/images/gmail.png')),
                      ),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 2.5),
                      circularFroastedContainer(
                        IconShowUp(
                            delay: delayAmount + 600,
                            child:
                                Image.asset('lib/src/images/phone-call.png')),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

Widget circularFroastedContainer(Widget child) {
  return SingleChildScrollView(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Expanded(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 12,
            padding: EdgeInsets.all(15),
            child: child,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff116466).withOpacity(0.25),
            ),
          ),
        ),
      ),
    ),
  );
}
