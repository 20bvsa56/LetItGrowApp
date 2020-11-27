import 'package:flutter/material.dart';
import 'package:letItGrow/src/model/career_model.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/appbar.dart';

import '../show_up.dart';

class CareerDetailPage extends StatefulWidget {
  CareerDetailPage({Key key}) : super(key: key);

  @override
  _CareerDetailPageState createState() => _CareerDetailPageState();
}

class _CareerDetailPageState extends State<CareerDetailPage> {
  List<CareerModel> vacancies() {
    return [
      CareerModel(
          id: 1,
          department: 'Administration',
          designation: 'Finance Manager',
          description:
              'Should be able to manage whole department Should be able to manage whole department Should be able to manage whole departmentShould be able to manage whole departmentShould be able to manage whole department',
          vacancyNumber: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          leading: IconButton(
              iconSize: SizeConfig.blockSizeHorizontal * 5.5,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(children: [
          Expanded(
            child: ListView(
                // scrollDirection: Axis.vertical,
                children: vacancies()
                    .map((elements) => CareerDetailsView(details: elements))
                    .toList()),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical),
          GestureDetector(
            onTap: () => _careerForm(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff36e3c7)),
              child: Text(
                'Apply',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical),
        ]),
      ),
    );
  }

  void _careerForm(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: SizeConfig.blockSizeVertical * 47,
            child: Column(
              children: [
                TextField(
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        color: Colors.black38),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                          color: Colors.redAccent),
                      suffixIcon:
                          Icon(Icons.person, color: Colors.black38, size: 20),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.black38),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black38,
                            width: SizeConfig.safeBlockHorizontal / 5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                TextField(
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        color: Colors.black38),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                          color: Colors.redAccent),
                      suffixIcon:
                          Icon(Icons.email, color: Colors.black38, size: 20),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.black38),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black38,
                            width: SizeConfig.safeBlockHorizontal / 5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                TextField(
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        color: Colors.black38),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                          color: Colors.redAccent),
                      suffixIcon: Icon(Icons.contact_phone,
                          color: Colors.black38, size: 20),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4,
                          color: Colors.black38),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black38,
                            width: SizeConfig.safeBlockHorizontal / 5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Row(children: [
                  Text('Upload CV',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          color: Color(0xff36e3c7))),
                  SizedBox(width: SizeConfig.safeBlockHorizontal * 4),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(width: 1, color: Colors.black54)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text('Choose File',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4.8,
                              color: Colors.black38)))
                ]),
                SizedBox(height: SizeConfig.blockSizeVertical * 3),
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
              ],
            ),
          );
        });
  }
}

class CareerDetailsView extends StatefulWidget {
  final CareerModel details;
  CareerDetailsView({Key key, this.details}) : super(key: key);

  @override
  _CareerDetailsViewState createState() => _CareerDetailsViewState();
}

class _CareerDetailsViewState extends State<CareerDetailsView> {
  int delayAmount = 400;
  List<BoxShadow> shadow = [
    BoxShadow(
        color: Colors.grey[600].withOpacity(0.2),
        blurRadius: 2,
        offset: Offset(4, 4))
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockSizeVertical * 78,
        decoration: BoxDecoration(
            color: Colors.white70,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconShowUp(
                        delay: delayAmount,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 6,
                          height: SizeConfig.safeBlockVertical * 6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/src/images/department.png'))),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      Text('Department',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1c9c9c).withOpacity(0.6))),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                        child: Text(
                      widget.details.department,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    )),
                  ),
                ]),
              )
            ]),
            Divider(
              color: Colors.grey[500],
              thickness: 0.2,
              indent: 0.2,
              endIndent: 0.2,
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconShowUp(
                        delay: delayAmount + 200,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 5.5,
                          height: SizeConfig.safeBlockVertical * 5.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/src/images/designation.png'))),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      Text('Designation',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1c9c9c).withOpacity(0.6))),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                        child: Text(
                      widget.details.designation,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    )),
                  ),
                ]),
              )
            ]),
            Divider(
              color: Colors.grey[500],
              thickness: 0.2,
              indent: 0.2,
              endIndent: 0.2,
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconShowUp(
                        delay: delayAmount + 400,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 5.5,
                          height: SizeConfig.safeBlockVertical * 5.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/src/images/description.png'))),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      Text('Job Description',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1c9c9c).withOpacity(0.6))),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                        child: Text(
                      widget.details.description,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    )),
                  ),
                ]),
              ),
            ]),
            Divider(
              color: Colors.grey[500],
              thickness: 0.2,
              indent: 0.2,
              endIndent: 0.2,
            ),
            SizedBox(height: SizeConfig.blockSizeVertical * 2),
            Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconShowUp(
                        delay: delayAmount + 600,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 5.5,
                          height: SizeConfig.safeBlockVertical * 5.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/src/images/vacancy.png'))),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                      Text('Number of Vacancies',
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1c9c9c).withOpacity(0.6))),
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical / 2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Center(
                        child: Text(
                      widget.details.vacancyNumber.toString(),
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5),
                    )),
                  ),
                ]),
              )
            ]),
            Divider(
              color: Colors.grey[500],
              thickness: 0.2,
              indent: 0.2,
              endIndent: 0.2,
            ),
          ]),
        ));
  }
}
