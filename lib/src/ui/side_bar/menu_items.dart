import 'package:flutter/material.dart';
import 'package:letItGrow/src/size/size_config.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon,
                size: SizeConfig.blockSizeHorizontal * 5.5,
                color: Colors.white),
            SizedBox(width: SizeConfig.blockSizeHorizontal * 4),
            Text(
              title,
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
