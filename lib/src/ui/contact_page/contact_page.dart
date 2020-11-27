import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/appbar.dart';
import 'package:letItGrow/src/ui/show_up.dart';

class ContactPage extends StatefulWidget with NavigationStates {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int delayAmount = 300;
  @override
  Widget build(BuildContext context) {
    final maxLines = 4;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: Text('Contact',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                  fontWeight: FontWeight.w600)),
        ),
        body: SafeArea(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/src/images/contact.jpeg'))),
            ),
            froastedContainer(Column(children: [
              TextField(
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      color: Colors.white),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3,
                        color: Colors.redAccent),
                    suffixIcon:
                        Icon(Icons.person, color: Colors.white, size: 20),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: SizeConfig.safeBlockHorizontal / 5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
              TextField(
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      color: Colors.white),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3,
                        color: Colors.redAccent),
                    suffixIcon:
                        Icon(Icons.email, color: Colors.white, size: 20),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: SizeConfig.safeBlockHorizontal / 5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
              TextField(
                  maxLines: maxLines,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      color: Colors.white),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 3,
                        color: Colors.redAccent),
                    suffixIcon:
                        Icon(Icons.message, color: Colors.white, size: 20),
                    labelText: 'Message',
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: SizeConfig.safeBlockHorizontal / 5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              SizedBox(height: SizeConfig.blockSizeVertical * 5),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff36e3c7)),
                child: Text(
                  'Send',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 6,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ])),
            // Positioned(
            //   bottom: 70,
            //   left: 185,
            //   child: Text('Copyright',style: TextStyle(color:Colors.white),)),
            Positioned(
              bottom: 15,
              left: 100,
              child: Row(
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
                        child: Image.asset('lib/src/images/phone-call.png')),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget froastedContainer(Widget child) {
  return SingleChildScrollView(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: child,
            decoration: BoxDecoration(
                // boxShadow: shadow,
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
      ),
    ),
  );
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
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ),
    ),
  );
}
