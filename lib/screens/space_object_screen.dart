import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:space_wiki/controllers/black_hole_controller.dart';
import 'package:space_wiki/controllers/interstellar_cloud_controller.dart';
import 'package:space_wiki/controllers/pulsar_controller.dart';
import 'package:space_wiki/controllers/star_controller.dart';
import 'package:space_wiki/widgets/large_content_card.dart';
import 'package:space_wiki/widgets/small_content_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controllers/nebulae_controller.dart';

class SpaceObjectsScreen extends StatelessWidget {
  const SpaceObjectsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    NebulaController nebulaController = Get.put(NebulaController());
    PulsarController pulsarController = Get.put(PulsarController());
    BlackHoleController blackHoleController = Get.put(BlackHoleController());
    StarController starController = Get.put(StarController());
    InterstellarCloudController interstellarCloudController = Get.put(InterstellarCloudController());

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
                  child: Row(
                      children: [
                        Text(
                          'Nebulae',
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
                  child: GetBuilder<NebulaController>(
                    init: nebulaController,
                    builder: (nebulaController) {
                      return Obx(() {
                        if (nebulaController.nebulae.isEmpty) {
                          return const Center(child: SpinKitSpinningLines(color: Colors.white));
                        } else {
                          return ListView.builder(
                            itemCount: nebulaController.nebulae.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SmallContentCard(
                                title: nebulaController.nebulae[index].nebulaName,
                                subtitle: nebulaController.nebulae[index].type,
                                size: 'Discovery Year: ' + nebulaController.nebulae[index].discoveryYear!,
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
                          'Pulsars',
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
                  child: GetBuilder<PulsarController>(
                    init: pulsarController,
                    builder: (pulsarController) {
                      return Obx(() {
                        if (pulsarController.pulsars.isEmpty) {
                          return const Center(child: SpinKitSpinningLines(color: Colors.white));
                        } else {
                          return ListView.builder(
                            itemCount: pulsarController.pulsars.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SmallContentCard(
                                title: pulsarController.pulsars[index].pulsarName,
                                subtitle: 'Age: ${pulsarController.pulsars[index].age}',
                                size: 'Discovery Year: ${pulsarController.pulsars[index].discoveryYear}',
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
                          'Black Holes',
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
                  child: GetBuilder<BlackHoleController>(
                    init: blackHoleController,
                    builder: (blackHoleController) {
                      return Obx(() {
                        if (blackHoleController.blackHoles.isEmpty) {
                          return const Center(child: SpinKitSpinningLines(color: Colors.white));
                        } else {
                          return ListView.builder(
                            itemCount: blackHoleController.blackHoles.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SmallContentCard(
                                title: blackHoleController.blackHoles[index].blackHoleName,
                                subtitle: 'Size: ${blackHoleController.blackHoles[index].size}',
                                size: 'Discovery Year: ${blackHoleController.blackHoles[index].discoveryYear}',
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
                          'Stars',
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
                  child: GetBuilder<StarController>(
                    init: starController,
                    builder: (starController) {
                      return Obx(() {
                        if (starController.stars.isEmpty) {
                          return const Center(child: SpinKitSpinningLines(color: Colors.white));
                        } else {
                          return ListView.builder(
                            itemCount: starController.stars.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SmallContentCard(
                                title: starController.stars[index].starName,
                                subtitle: 'Size: ${starController.stars[index].size}',
                                size: 'Discovery Year: ${starController.stars[index].discoveryYear}',
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
                          'Interstellar Clouds',
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
                  child: GetBuilder<InterstellarCloudController>(
                    init: interstellarCloudController,
                    builder: (interstellarCloudController) {
                      return Obx(() {
                        if (interstellarCloudController.interstellarClouds.isEmpty) {
                          return const Center(child: SpinKitSpinningLines(color: Colors.white));
                        } else {
                          return ListView.builder(
                            itemCount: interstellarCloudController.interstellarClouds.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SmallContentCard(
                                title: interstellarCloudController.interstellarClouds[index].cloudName,
                                subtitle: 'Type: ${interstellarCloudController.interstellarClouds[index].type}',
                                size: 'Discovery Year: ${interstellarCloudController.interstellarClouds[index].discoveryYear}',
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
