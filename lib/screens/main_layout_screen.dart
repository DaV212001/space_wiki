import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:space_wiki/screens/space_object_screen.dart';
import 'package:space_wiki/screens/space_terms_screen.dart';

import '../utils/app_routes.dart';
import 'home_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late PersistentTabController _controller;
  bool isLoggedIn = false;

  @override
  void initState() {
    _controller = PersistentTabController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const HomeScreen(),
        const SpaceObjectsScreen(),
        const SpaceTermsScreen(),
      ];
    }

    return Scaffold(
      body: PersistentTabView(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context,
        controller: _controller,
        screens: buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
        ),
        navBarStyle: NavBarStyle.style11,
        navBarHeight: 60,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    Color activeColor = Colors.white;
    Color inactiveColor = Colors.white24;
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            FontAwesomeIcons.house,
            color: activeColor,
          ),
          inactiveIcon: Icon(
            FontAwesomeIcons.house,
            color: inactiveColor,
          ),
          title: ('Home'),
          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 10),
          activeColorPrimary: activeColor,
          inactiveColorPrimary: inactiveColor,
          routeAndNavigatorSettings:
              const RouteAndNavigatorSettings(initialRoute: AppRoutes.home)),
      PersistentBottomNavBarItem(
          icon: Icon(
            FontAwesomeIcons.earthAfrica,
            color: activeColor,
          ),
          inactiveIcon: Icon(
            FontAwesomeIcons.earthAfrica,
            color: inactiveColor,
          ),
          title: ('Space objects'),
          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 10),
          activeColorPrimary: activeColor,
          inactiveColorPrimary: inactiveColor),
      PersistentBottomNavBarItem(
          icon: Icon(
            FontAwesomeIcons.book,
            color: activeColor,
          ),
          inactiveIcon: Icon(
            FontAwesomeIcons.book,
            color: inactiveColor,
          ),
          title: ('Space terms'),
          textStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 10),
          activeColorPrimary: activeColor,
          inactiveColorPrimary: inactiveColor),
    ];
  }
}
