import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_wiki/controllers/galaxy_controller.dart';
import 'package:space_wiki/controllers/planet_controller.dart';
import 'package:space_wiki/screens/planet_detail_screen.dart';
import 'package:space_wiki/screens/space_terms_screen.dart';
import 'package:space_wiki/widgets/galaxy_card.dart';
import 'package:space_wiki/widgets/large_content_card.dart';
import 'package:space_wiki/widgets/small_content_card.dart';

import '../utils/animations.dart';
import '../widgets/head.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HomeScreenHeader(),
              _buildPlanetSection(width: width, height: height),
              _buildSolarPlanetsSection(width: width),
              _buildGalaxiesSection(width: width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanetSection({required double width, required double height}) {
    final planetController = Get.put(PlanetController());
    final animationsMap = {
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, 70),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Planets',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Obx(() {
          return SizedBox(
              height: planetController.planets.isEmpty
                  ? height * 0.35 - 30
                  : height * 0.35,
              width: width,
              child: planetController.planets.isEmpty
                  ? ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoadingShimmer());
                      },
                    )
                  : ListView.builder(
                      itemCount: planetController.planets.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(PlanetDetailScreen(
                                planet: planetController.planets[index]));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmallContentCard(
                              title: planetController.planets[index].planetName,
                              subtitle: planetController.planets[index].type,
                              size: planetController.planets[index].size,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!);
                      },
                    ));
        }),
      ],
    );
  }

  Widget _buildSolarPlanetsSection({required double width}) {
    final planetController = Get.put(PlanetController());
    final animationsMap = {
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, 70),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Solar Planets',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Obx(() {
          return SizedBox(
              height: 240,
              width: width,
              child: planetController.solarPlanets.isEmpty
                  ? ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity:
                              planetController.solarPlanets.isEmpty ? 1 : 0,
                          child: Shimmer(
                            gradient: LinearGradient(colors: [
                              Colors.black26,
                              Colors.white,
                              Colors.black26
                            ]),
                            loop: 1000,
                            child: Container(
                              width: width,
                              height: 240,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: planetController.solarPlanets.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(PlanetDetailScreen(
                                planet: planetController.solarPlanets[index]));
                          },
                          child: LargeContentCard(
                            title:
                                planetController.solarPlanets[index].planetName,
                            headTitle:
                                planetController.solarPlanets[index].type,
                            subtitle:
                                'Suitability for life: ${planetController.solarPlanets[index].suitabilityForLife}',
                            bottomText: 'Distance from Earth',
                            bottomNumber:
                                '${planetController.solarPlanets[index].distanceFromEarth} AU',
                          ),
                        );
                      },
                    ));
        }),
      ],
    );
  }

  Widget _buildGalaxiesSection({required double width}) {
    final galaxyController = Get.put(GalaxyController());
    final animationsMap = {
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, 70),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Galaxies',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Obx(
          () {
            return SizedBox(
                height: 240,
                width: width,
                child: galaxyController.galaxies.isEmpty
                    ? ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: galaxyController.galaxies.isEmpty ? 1 : 0,
                            child: Shimmer(
                              gradient: LinearGradient(colors: [
                                Colors.black26,
                                Colors.white,
                                Colors.black26
                              ]),
                              loop: 1000,
                              child: Container(
                                width: width,
                                height: 240,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: galaxyController.galaxies.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GalaxyCard(
                            title: galaxyController.galaxies[index].galaxyName,
                            subtitle: galaxyController.galaxies[index].funFacts,
                            titleSmall:
                                '${galaxyController.galaxies[index].diameter} light years across',
                            numOfStars:
                                galaxyController.galaxies[index].numberOfStars,
                            age: galaxyController.galaxies[index].age,
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!);
                        },
                      ));
          },
        ),
      ],
    );
  }
}
