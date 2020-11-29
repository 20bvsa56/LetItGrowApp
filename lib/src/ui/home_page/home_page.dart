import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/appbar.dart';
import 'package:letItGrow/src/ui/drawer.dart';

class HomePage extends StatefulWidget with NavigationStates {
  final Widget child;
  final int delay;
  HomePage({Key key, this.child, this.delay}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int delayAmount = 200;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: Text('Home',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  fontWeight: FontWeight.w600)),
        ),
        
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(children: [
              SizedBox(height: SizeConfig.safeBlockVertical),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 58,
                      bottom: 5,
                      child: Container(
                        child: Text('L',
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 6,
                              color: Colors.red,
                            )),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      bottom: 16,
                      child: Text('E',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 88,
                      bottom: 10,
                      child: Text('T',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 120,
                      bottom: 10,
                      child: Text('I',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 8,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 130,
                      bottom: 1,
                      child: Text('T',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: SizeConfig.safeBlockHorizontal * 8,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 168,
                      bottom: 13,
                      child: Text('G',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 187,
                      bottom: 6,
                      child: Text('R',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 204,
                      bottom: 8,
                      child: Text('O',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    ),
                    Positioned(
                      left: 224,
                      bottom: 5,
                      child: Text('W',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 6,
                            color: Colors.red,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4),
              Text(
                'Demo Projects',
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(horizontal: 20),

                height: SizeConfig.blockSizeVertical * 20,
                //  width: SizeConfig.blockSizeHorizontal * 20,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(children: [
                  IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                    // color: Colors.white,
                    height: 130,
                    width: 250,
                    child: Text(
                      'A company growing in the field of information technology.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.8),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
