import 'dart:async';

import 'package:flutter/material.dart';
import 'package:letItGrow/src/size/size_config.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  //const SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSideBarOpenStreamController;
  Stream<bool>
      isSideBarOpenStream; //get value of what stream controller is having
  StreamSink<bool> isSideBarOpenSink; //add sth to stream

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    isSideBarOpenStreamController = PublishSubject<bool>();
    isSideBarOpenStream = isSideBarOpenStreamController.stream;
    isSideBarOpenSink = isSideBarOpenStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenStreamController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
        initialData: false,
        stream: isSideBarOpenStream,
        builder: (context, isSideBarOpenAsync) {
          return AnimatedPositioned(
            top: 0,
            bottom: 0,
            left: isSideBarOpenAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenAsync.data ? 0 : screenWidth - 45,
            duration: Duration(milliseconds: 500),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Color(0xff8255a3),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 2),
                              CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        // image: DecorationImage(
                                        //     image: AssetImage(
                                        //         'lib/src/images/girl.jpeg'),
                                        //     fit: BoxFit.cover)
                                            ),
                                  )),
                              SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 4),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bivisha Karki',
                                      style: TextStyle(
                                          // fontFamily: 'Abel-Regular',
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'bivisha2056@gmail.com',
                                      style: TextStyle(
                                          // fontFamily: 'Abel-Regular',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 3),
                        Divider(
                          thickness: 0.5,
                          color: Colors.white,
                          indent: 32,
                          endIndent: 32,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //     icon: Icons.home,
                        //     title: "Home",
                        //     onTap: () {
                        //       onIconPressed();
                        //       BlocProvider.of<NavigationBloc>(context)
                        //           .add(NavigationEvents.HomePageClickedEvent);
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //       icon: Icons.category,
                        //       title: "Category",
                        //       onTap: () {
                        //         onIconPressed();
                        //         BlocProvider.of<NavigationBloc>(context).add(
                        //             NavigationEvents.CategoryPageClickedEvent);
                        //       }),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //     icon: FontAwesomeIcons.tags,
                        //     title: "Offer",
                        //     onTap: () {
                        //       onIconPressed();
                        //       BlocProvider.of<NavigationBloc>(context)
                        //           .add(NavigationEvents.OfferPageClickedEvent);
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //     icon: FontAwesomeIcons.heart,
                        //     title: "Loyalty",
                        //     onTap: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => LoyaltyPage()));
                        //     },
                        //   ),
                        // ),
                        // SizedBox(height: SizeConfig.safeBlockVertical),
                        // Divider(
                        //   thickness: 0.5,
                        //   color: Colors.white,
                        //   indent: 32,
                        //   endIndent: 32,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //     icon: Icons.perm_identity,
                        //     title: "Profile",
                        //     onTap: () {
                        //       onIconPressed();
                        //       BlocProvider.of<NavigationBloc>(context).add(
                        //           NavigationEvents.ProfilePageClickedEvent);
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: MenuItem(
                        //       icon: Icons.exit_to_app, title: "Logout"),
                        // ),
                      ],
                    ),
                  )),
                  Align(
                    alignment: Alignment(0, -0.98),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: Color(0xff8255a3),
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              color: Colors.white,
                              progress: _animationController.view),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;
    Path path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
