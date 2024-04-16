import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:space_wiki/controllers/galaxy_controller.dart';
import 'package:space_wiki/controllers/planet_controller.dart';
import 'package:space_wiki/widgets/galaxy_card.dart';
import 'package:space_wiki/widgets/large_content_card.dart';
import 'package:space_wiki/widgets/small_content_card.dart';
import '../widgets/head.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    PlanetController planetController = Get.put(PlanetController());
    GalaxyController galaxyController = Get.put(GalaxyController());
    return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomeScreenHeader(),
                    const Row(
                      children: [
                        Text(
                          'Planets',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        )
                      ]
                    ),
                    SizedBox(
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: GetBuilder<PlanetController>(
                        init: planetController,
                        builder: (planetController) {
                          return Obx(() {
                            if (planetController.planets.isEmpty) {
                              return const Center(child: SpinKitSpinningLines(color: Colors.white));
                            } else {
                              return ListView.builder(
                                itemCount: planetController.planets.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SmallContentCard(
                                    title: planetController.planets[index].planetName,
                                    subtitle: planetController.planets[index].type,
                                    size: planetController.planets[index].size,
                                  );
                                },
                              );
                            }
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              'Solar Planets',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: GetBuilder<PlanetController>(
                        init: planetController,
                        builder: (planetController) {
                          return Obx(() {
                            if (planetController.solarPlanets.isEmpty) {
                              return const Center(child: SpinKitSpinningLines(color: Colors.white));
                            } else {
                              return ListView.builder(
                                itemCount: planetController.solarPlanets.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return LargeContentCard(
                                    title: planetController.solarPlanets[index].planetName,
                                    headTitle: planetController.solarPlanets[index].type,
                                    subtitle: 'Suitability for life: ${planetController.solarPlanets[index].suitabilityForLife}',
                                    bottomText: 'Distance from Earth',
                                    bottomNumber: '${planetController.solarPlanets[index].distanceFromEarth} AU',
                                  );
                                },
                              );
                            }
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Text(
                              'Galaxies',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            )
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: GetBuilder<GalaxyController>(
                        init: galaxyController,
                        builder: (galaxyController) {
                          return Obx(() {
                            if (galaxyController.galaxies.isEmpty) {
                              return const Center(child: SpinKitSpinningLines(color: Colors.white));
                            } else {
                              return ListView.builder(
                                itemCount: galaxyController.galaxies.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GalaxyCard(
                                    title: galaxyController.galaxies[index].galaxyName,
                                    subtitle: galaxyController.galaxies[index].funFacts,
                                    titleSmall: '${galaxyController.galaxies[index].diameter} light years across',
                                    numOfStars: galaxyController.galaxies[index].numberOfStars,
                                    age: galaxyController.galaxies[index].age,
                                  );
                                },
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
