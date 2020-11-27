import 'package:flutter/material.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/contact_page/contact_page.dart';
import 'package:letItGrow/src/ui/home_page/home_page.dart';

import 'career_page/career_page.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int defaultSelectedIndex;

  CustomBottomNavigation({Key key, this.defaultSelectedIndex = 0})
      : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  List pages = [HomePage(), CareerPage(), ContactPage()];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            _buildNavBarItem(Icons.home, 0),
            _buildNavBarItem(Icons.work, 1),
            _buildNavBarItem(Icons.contact_page, 2)
          ],
        ),
        body: pages[_selectedIndex]);
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 12),
        height: SizeConfig.blockSizeVertical * 7,
        width: SizeConfig.blockSizeHorizontal * 100 / 3,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                color: Color(0xff36e3c7),
                gradient: LinearGradient(colors: [
                  Color(0xff36e3c7).withOpacity(0.28),
                  Color(0xff36e3c7).withOpacity(0.015)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                border: Border(
                    bottom: BorderSide(
                        width: SizeConfig.blockSizeHorizontal,
                        color: index == _selectedIndex
                            ? Color(0xff36e3c7)
                            : Colors.white),
                    top: BorderSide(
                        width: SizeConfig.blockSizeHorizontal / 10,
                        color: Color(0xff36e3c7).withOpacity(0.5))),
              )
            : BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: SizeConfig.blockSizeHorizontal / 8,
                        color: Color(0xff36e3c7).withOpacity(0.5)))),
        child: Column(
          children: [
            Icon(icon,
                color: Colors.grey.withOpacity(0.8),
                size: SizeConfig.blockSizeHorizontal * 7),
          ],
        ),
      ),
    );
  }
}
