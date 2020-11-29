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
                  Colors.grey.withOpacity(0.2),
                  Color(0xff36e3c7).withOpacity(0.010)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                border: Border(
                    bottom: BorderSide(
                        width: SizeConfig.blockSizeHorizontal / 2,
                        color: index == _selectedIndex
                            ? Color(0xff36e3c7).withOpacity(0.3)
                            : Colors.white),
                    top: BorderSide(
                        width: SizeConfig.blockSizeHorizontal / 20,
                        color: Colors.grey)),
              )
            : BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: SizeConfig.blockSizeHorizontal / 20,
                        color: Colors.grey))),
        child: Column(
          children: [
            Icon(icon,
                color: index == _selectedIndex
                    ? Color(0xff116466).withOpacity(0.7)
                    : Color(0xff116466).withOpacity(0.5),
                size: SizeConfig.blockSizeHorizontal * 7),
          ],
        ),
      ),
    );
  }
}
