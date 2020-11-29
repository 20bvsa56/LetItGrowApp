import 'package:flutter/material.dart';
import 'package:letItGrow/src/blocs/navigation_bloc.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:letItGrow/src/ui/home_page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letItGrow/src/ui/side_bar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(HomePage()),
      child: Stack(
        children: [
          SideBar(),
          BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
            return navigationState as Widget;
          }),
          
        ],
      ),
    ));
  }
}
