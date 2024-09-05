import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:space_wiki/constants/app_constants.dart';
import 'package:space_wiki/screens/main_layout_screen.dart';

import '../configs/config_preference.dart';
import '../widgets/main_button.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _currentPageAsDouble = 0;
  List<Map<String, dynamic>> pagesData = [
    {
      'title': 'Welcome to Space Wiki',
      'image': KDefImageJ,
      'description':
      'Learn about the universe, its planets, and their galaxies',
    },
    {
      'title': 'Learn about space related terms',
      'image': KDefImageJ,
      'description':
      'Explore the different types of space related terms and their meanings.',
    },
    {
      'title': 'Increase your space knowledge',
      'image': KDefImageJ,
      'description':
      'Increase your space literacy by looking up different objects in the universe and their properties.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageAsDouble = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final  theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<Widget> pages = [];
    for (var item in pagesData) {
      Widget page = Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40)
                ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                        '${item['image']}',
                        width: width * 0.5,
                        height: height * 0.3
                    ),
                  )
              ),
              Text(
                item['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                    fontSize: 25,),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item['description'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      );
      pages.add(page);
    }
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    children: pages,
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                  ),
                ),
                if (pages.length > 1)
                  DotsIndicator(
                    dotsCount: pages.length,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      activeColor: Colors.white,
                      color: Colors.black,
                      activeSize: const Size(15, 15),
                      size: const Size(10, 10),
                    ),
                  ),

                SizedBox(
                  width: 300,
                  child: MainButton(
                      text: "Next",
                      onPress: _currentPage == pages.length - 1
                          ? onPressedOnLastPage
                          : _animateToNextPage),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _animateToNextPage() async {
    await _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void onPressedOnLastPage() async {
    ConfigPreference.setFirstLaunchCompleted();
    Get.offAll(MainLayoutScreen());
  }
}
