import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_wiki/controllers/black_hole_controller.dart';
import 'package:space_wiki/controllers/interstellar_cloud_controller.dart';
import 'package:space_wiki/controllers/pulsar_controller.dart';
import 'package:space_wiki/controllers/star_controller.dart';
import 'package:space_wiki/screens/space_terms_screen.dart';
import 'package:space_wiki/widgets/large_content_card.dart';
import 'package:space_wiki/widgets/small_content_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controllers/nebulae_controller.dart';
import '../utils/animations.dart';

class SpaceObjectsScreen extends StatelessWidget {
  const SpaceObjectsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    NebulaController nebulaController = Get.put(NebulaController());
    PulsarController pulsarController = Get.put(PulsarController());
    BlackHoleController blackHoleController = Get.put(BlackHoleController());
    StarController starController = Get.put(StarController());
    InterstellarCloudController interstellarCloudController =
        Get.put(InterstellarCloudController());
    double height = MediaQuery.of(context).size.height;
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      'Nebulae',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ]),
                ),
                Obx(() {
                  return SizedBox(
                    height: nebulaController.nebulae.isEmpty
                        ? height * 0.35 - 30
                        : height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<NebulaController>(
                      init: nebulaController,
                      builder: (nebulaController) {
                        if (nebulaController.nebulae.isEmpty) {
                          return ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LoadingShimmer(),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            itemCount: nebulaController.nebulae.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallContentCard(
                                  title: nebulaController
                                      .nebulae[index].nebulaName,
                                  subtitle:
                                      nebulaController.nebulae[index].type,
                                  size: 'Discovery Year: ' +
                                      nebulaController
                                          .nebulae[index].discoveryYear!,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!);
                            },
                          );
                        }
                        ;
                      },
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      'Pulsars',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ]),
                ),
                Obx(() {
                  return SizedBox(
                    height: pulsarController.pulsars.isEmpty
                        ? height * 0.35 - 30
                        : height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<PulsarController>(
                      init: pulsarController,
                      builder: (pulsarController) {
                        if (pulsarController.pulsars.isEmpty) {
                          return ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LoadingShimmer(),
                                );
                              });
                        } else {
                          return ListView.builder(
                            itemCount: pulsarController.pulsars.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallContentCard(
                                  title: pulsarController
                                      .pulsars[index].pulsarName,
                                  subtitle:
                                      'Age: ${pulsarController.pulsars[index].age}',
                                  size:
                                      'Discovery Year: ${pulsarController.pulsars[index].discoveryYear}',
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!);
                            },
                          );
                        }
                        ;
                      },
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      'Black Holes',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ]),
                ),
                Obx(() {
                  return SizedBox(
                    height: blackHoleController.blackHoles.isEmpty
                        ? height * 0.35 - 30
                        : height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<BlackHoleController>(
                      init: blackHoleController,
                      builder: (blackHoleController) {
                        if (blackHoleController.blackHoles.isEmpty) {
                          return ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LoadingShimmer(),
                                );
                              });
                        } else {
                          return ListView.builder(
                            itemCount: blackHoleController.blackHoles.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallContentCard(
                                  title: blackHoleController
                                      .blackHoles[index].blackHoleName,
                                  subtitle:
                                      'Size: ${blackHoleController.blackHoles[index].size}',
                                  size:
                                      'Discovery Year: ${blackHoleController.blackHoles[index].discoveryYear}',
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!);
                            },
                          );
                        }
                        ;
                      },
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      'Stars',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ]),
                ),
                Obx(() {
                  return SizedBox(
                    height: starController.stars.isEmpty
                        ? height * 0.35 - 30
                        : height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<StarController>(
                      init: starController,
                      builder: (starController) {
                        if (starController.stars.isEmpty) {
                          return ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LoadingShimmer(),
                                );
                              });
                        } else {
                          return ListView.builder(
                            itemCount: starController.stars.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallContentCard(
                                  title: starController.stars[index].starName,
                                  subtitle:
                                      'Size: ${starController.stars[index].size}',
                                  size:
                                      'Discovery Year: ${starController.stars[index].discoveryYear}',
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!);
                            },
                          );
                        }
                      },
                    ),
                  );
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      'Interstellar Clouds',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ]),
                ),
                Obx(() {
                  return SizedBox(
                    height:
                        interstellarCloudController.interstellarClouds.isEmpty
                            ? height * 0.35 - 30
                            : height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<InterstellarCloudController>(
                      init: interstellarCloudController,
                      builder: (interstellarCloudController) {
                        if (interstellarCloudController
                            .interstellarClouds.isEmpty) {
                          return ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LoadingShimmer()
                                );
                              });
                        } else {
                          return ListView.builder(
                            itemCount: interstellarCloudController
                                .interstellarClouds.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallContentCard(
                                  title: interstellarCloudController
                                      .interstellarClouds[index].cloudName,
                                  subtitle:
                                      'Type: ${interstellarCloudController.interstellarClouds[index].type}',
                                  size:
                                      'Discovery Year: ${interstellarCloudController.interstellarClouds[index].discoveryYear}',
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['containerOnPageLoadAnimation']!);
                            },
                          );
                        }
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
