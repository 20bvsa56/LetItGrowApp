import 'package:flutter/material.dart';
import 'package:letItGrow/src/size/size_config.dart';

class CareerForm extends StatefulWidget {
  CareerForm({Key key}) : super(key: key);

  @override
  _CareerFormState createState() => _CareerFormState();
}

class _CareerFormState extends State<CareerForm> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color:Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          height: SizeConfig.safeBlockVertical * 80,
        );
      },
      onClosing: () {},
    );
  }
}
