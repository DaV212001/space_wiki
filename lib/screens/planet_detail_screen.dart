import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';

import '../models/planet.dart';
import '../utils/animations.dart';
import '../widgets/earth_distance_indicator.dart';
import '../widgets/header_image_and_text.dart';

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  PlanetDetailScreen({required this.planet});

  Map<String, double> getDataMap() {
    Map<String, double> dataMap = {};
    if (planet.atmosphericComposition != null) {
      for (var element in planet.atmosphericComposition!) {
        dataMap[element.element] = element.percentage;
      }
    }
    return dataMap;
  }

  double getTotalValue() {
    double total = 0.0;
    planet.atmosphericComposition!.forEach((element) {
      total += element.percentage;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      // Interesting Fact
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          planet.interestingFacts ??
                              'No interesting facts available',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Details Row
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildDetailContainer(
                                'Age', planet.age ?? 'Unknown'),
                            if (planet.earthsItCouldFit != null)
                              _buildDetailContainer('Could Fit',
                                  '${planet.earthsItCouldFit} Earths'),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: EarthDistanceIndicator(
                            isSolar: planet.isSolar,
                            distanceInLightYears:
                                double.parse(planet.distanceFromEarth!)),
                      ),
                      if (!planet.isSolar! &&
                          planet.atmosphericComposition != null &&
                          planet.atmosphericComposition!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: PieChart(
                                dataMap: getDataMap(),
                                legendOptions: LegendOptions(
                                    showLegendsInRow: false,
                                    legendPosition: LegendPosition.left),
                                chartType: ChartType.ring,
                                baseChartColor:
                                    Colors.grey[50]!.withOpacity(0.15),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                ),
                                totalValue: getTotalValue(),
                              ),
                            ),
                          ),
                        ),
                      // Remaining Data
                      !planet.isSolar!
                          ? buildDescriptionSection()
                          : buildSolarDescriptionSection(context),
                    ]),
              ),
            ),
          ]),
    );
  }

  Widget buildDescriptionSection() {
    if (planet.isSolar!) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetailRow('Type', planet.type),
            _buildDetailRow('Suitability for Life', planet.suitabilityForLife),
          ],
        ),
      ]);
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Type', planet.type),
          _buildDetailRow('Suitability for Life', planet.suitabilityForLife),
          _buildDetailRow('Star System', planet.starSystem),
          _buildDetailRow('Galaxy', planet.galaxy),
          _buildDetailRow('Discovered in', planet.discoveryYear.toString()),
        ],
      ),
    );
  }

  Widget _buildDetailContainer(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }

  Column buildHeader(BuildContext context) {
    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: Offset(0, 170),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
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
            begin: Offset(0, -250),
            end: Offset(0, 0),
          ),
        ],
      ),
    };

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderImageAndButtons()
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
      Row(
        children: [
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
              child: Text(
                planet.planetName!,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: _buildDetailRow('', planet.discoveryYear.toString()),
          ),
        ],
      )
    ]);
  }

  Map<String, String> planetDescriptions = {
    'Terrestrial':
        'A terrestrial planet, also known as a telluric or rocky planet, is a celestial body primarily composed of silicate rocks or metals. Within our Solar System, the terrestrial planets accepted by the International Astronomical Union (IAU) are the inner planets closest to the Sun: Mercury, Venus, Earth, and Mars',
    'Gas Giant':
        'A gas giant is a giant planet mainly composed of hydrogen and helium. Jupiter and Saturn are the gas giants in our Solar System. Originally, the term “gas giant” was synonymous with “giant planet.” However, it was later discovered that Uranus and Neptune are a distinct class of giant planets, primarily composed of heavier volatile substances (referred to as “ices”). As a result, Uranus and Neptune are now classified as ice giants',
    'Ice Giant':
        'An ice giant is a giant planet composed mainly of elements heavier than hydrogen and helium, such as oxygen, carbon, nitrogen, and sulfur. The Solar System has two ice giants: Uranus and Neptune. Unlike gas giants, ice giants lack well-defined solid surfaces and are primarily composed of gases and liquids. Their constituent compounds were solids during their formation, either directly as ice or trapped in water ice. Today, very little of the water in Uranus and Neptune remains in the form of ice; instead, it exists as supercritical fluid within these planets',
    'Dwarf planet':
        'A dwarf planet is a small planetary-mass object that orbits the Sun. It has enough mass to assume a nearly round shape but lacks certain technical criteria required for it to be classified as a full-fledged planet. Specifically, a dwarf planet has not cleared its neighborhood around its orbit and is not a moon',
    'Suitability':
        'These ratings are based on factors such as the planet\'s size, distance from its star, atmosphere composition, potential for liquid water, and other parameters relevant to habitability.'
  };

  void showDescriptionDialog(String type, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    child: Text(
                      planetDescriptions[type]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildSolarDescriptionSection(BuildContext context) {
    var metric = int.parse(planet.suitabilityForLife!.split(' ')[0]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Atmospheric Composition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PieChart(
                      dataMap: getDataMap(),
                      legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.left),
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      totalValue: getTotalValue(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDescriptionDialog(planet.type!, context);
                    },
                    child: Container(
                      height: 160,
                      width: 100,
                      decoration: BoxDecoration(
                          color: planet.type == 'Terrestrial'
                              ? Colors.white24
                              : Colors.black26,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 26.0),
                                  child: SizedBox(),
                                ),
                                Text(
                                  'Type',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          planet.type == 'Terrestrial'
                              ? Lottie.asset('assets/lottie/terrestrial.json',
                                  width: 100)
                              : planet.type == 'Gas Giant'
                                  ? Lottie.asset('assets/lottie/gas.json',
                                      width: 100)
                                  : Lottie.asset('assets/lottie/dwarf.json',
                                      width: 100),
                          Text(planet.type!),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDescriptionDialog('Suitability', context);
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Suitability for life',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          metric > 7
                              ? Lottie.asset(
                                  'assets/lottie/sust_life_good.json')
                              : metric > 4
                                  ? Lottie.asset(
                                      'assets/lottie/sust_life_medium.json')
                                  : Lottie.asset(
                                      'assets/lottie/sust_life_bad.json'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(planet.suitabilityForLife!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    if (planet.isSolar! && title == 'Suitability for Life') {
      int metric = int.parse(value!.split(' ')[0]);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              metric > 7
                  ? Lottie.asset('assets/lottie/sust_life_good.json')
                  : metric > 4
                      ? Lottie.asset('assets/lottie/sust_life_medium.json')
                      : Lottie.asset('assets/lottie/sust_life_bad.json'),
              Text(value!),
            ],
          ),
        ),
      );
    }
    if (planet.isSolar! && title == 'Type') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 150,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: value == 'Terrestrial' ? Colors.white24 : Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              value == 'Terrestrial'
                  ? Lottie.asset('assets/lottie/terrestrial.json')
                  : value == 'Gas Giant'
                      ? Lottie.asset('assets/lottie/gas.json')
                      : Lottie.asset('assets/lottie/dwarf.json'),
              Text(value!),
            ],
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(value ?? 'N/A'),
        SizedBox(height: 12),
      ],
    );
  }
}
