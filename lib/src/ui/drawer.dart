import 'package:flutter/material.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/side_bar/menu_items.dart';

Widget drawer() {
  return Container(
    height: SizeConfig.blockSizeVertical * 100,
    width: SizeConfig.safeBlockHorizontal * 70,
    decoration: BoxDecoration(
        color: Color(0xff116466).withOpacity(0.85),
        border: Border.all(width: 0.2, color: Colors.white),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50))),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: SizeConfig.safeBlockVertical * 10,
            width: SizeConfig.blockSizeHorizontal * 15,
            child: Image.asset('lib/src/images/logo.png'),
          ),
          Column(children: [
            Text(
              'LET IT GROW PVT LTD',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.6,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'info@letitgrownepal.com',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.1,
                  fontWeight: FontWeight.w400),
            )
          ]),
          SizedBox(width: SizeConfig.blockSizeHorizontal * 3)
        ],
      ),
      SizedBox(height: SizeConfig.blockSizeVertical),
      Divider(
        thickness: 2,
        color: Color(0xff1c9c9c).withOpacity(0.6),
      ),
      SizedBox(height: SizeConfig.blockSizeVertical),
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(
                icon: Icons.person,
                title: "My Profile",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.help,
                title: "Our Services",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.more_rounded,
                title: "About Us",
                onTap: () {},
              ),
              Row(children: [
                IconButton(
                    icon: Icon(Icons.exit_to_app,
                        size: SizeConfig.blockSizeHorizontal * 6,
                        color: Colors.white),
                    onPressed: null),
                Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )
              ])
            ]),
      ),
    ]),
  );
}
