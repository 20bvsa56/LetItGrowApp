import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';
import 'package:letItGrow/src/model/career_model.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/appbar.dart';
import 'package:letItGrow/src/ui/drawer.dart';
import 'package:letItGrow/src/ui/show_up.dart';

import 'career_detail_page.dart';

class CareerPage extends StatefulWidget with NavigationStates {
  CareerPage({Key key}) : super(key: key);

  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  int delayAmount = 200;

  List<CareerModel> vacancies() {
    return [
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description: 'Should be able to manage whole department',
          vacancyNumber: 1),
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description: 'Should be able to manage whole department',
          vacancyNumber: 1),
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description: 'Should be able to manage whole department',
          vacancyNumber: 1),
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description: 'Should be able to manage whole department',
          vacancyNumber: 1),
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description: 'Should be able to manage whole department',
          vacancyNumber: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        backgroundColor: Colors.white,
        appBar: MyAppBar(
         
          title: Text('Career',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 1.2),
            Text(
              'Available Vacancies',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical),
            Expanded(
              child: ListView(
                  children: vacancies().map((elements) {
                return VacancyView(vacancy: elements);
              }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class VacancyView extends StatefulWidget {
  final CareerModel vacancy;
  VacancyView({Key key, this.vacancy}) : super(key: key);

  @override
  _VacancyViewState createState() => _VacancyViewState();
}

class _VacancyViewState extends State<VacancyView> {
  int delayAmount = 300;
  List<BoxShadow> shadow = [
    BoxShadow(
        color: Colors.grey[400].withOpacity(0.2),
        blurRadius: 0.2,
        spreadRadius: 0.2,
        offset: Offset(3, 3))
  ];
  @override
  Widget build(BuildContext context) {
    return ShowUp(
      delay: delayAmount,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white70,
            boxShadow: shadow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(120, 40),
                bottomRight: Radius.elliptical(120, 40))),
        child: Row(children: [
          Container(
            width: SizeConfig.blockSizeHorizontal * 60,
            child: Column(children: [
              ShowUp(
                delay: delayAmount + 1200,
                child: Text('Designation-',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c9c9c).withOpacity(0.6))),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical / 2),
              ShowUp(
                delay: delayAmount + 2300,
                child: Text(widget.vacancy.designation,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        color: Colors.black45)),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 2),
              ShowUp(
                delay: delayAmount + 1200,
                child: Text('Vacancy Number-',
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1c9c9c).withOpacity(0.6))),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical / 2),
              ShowUp(
                delay: delayAmount + 2300,
                child: Text(widget.vacancy.vacancyNumber.toString(),
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 1.8,
                        color: Colors.black45)),
              )
            ]),
          ),
          Spacer(),
          ShowUp(
            delay: delayAmount + 3000,
            child: IconButton(
                iconSize: SizeConfig.blockSizeHorizontal * 5.2,
                icon: Icon(Icons.remove_red_eye, color: Colors.black54),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CareerDetailPage()));
                }),
          )
        ]),
      ),
    );
  }
}
