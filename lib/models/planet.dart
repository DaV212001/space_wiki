// planet_model.dart
import 'atmospheric_composition.dart';

class Planet {
  final int? id;
  final String? planetName;
  final String? size;
  final String? type;
  final String? suitabilityForLife;
  final String? distanceFromEarth;
  final String? earthsItCouldFit;
  final String? gravityLevels;
  final String? oxygenLevels;
  final String? nitrogenLevels;
  final String? discoveryYear;
  final String? age;
  final String? starSystem;
  final String? galaxy;
  final String? interestingFacts;
  final List<AtmosphericComposition>? atmosphericComposition;
  final bool? isSolar;
  Planet({
     this.id,
    this.isSolar,
    this.planetName,
     this.size,
     this.type,
     this.suitabilityForLife,
     this.distanceFromEarth,
     this.earthsItCouldFit,
     this.gravityLevels,
     this.oxygenLevels,
     this.nitrogenLevels,
     this.discoveryYear,
     this.age,
     this.starSystem,
     this.galaxy,
     this.interestingFacts,
     this.atmosphericComposition
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'],
      isSolar: json.containsKey('Atmospheric Composition'),
      planetName: json['planet_name'],
      size: json['Size'],
      type: json['Type'],
      suitabilityForLife: json['Suitability for Life'],
      distanceFromEarth: json['Distance from Earth (light years)'] is double || json['Distance from Earth (light years)'] is int? json['Distance from Earth (light years)'].toString() : json['Distance from Earth (light years)'],
      earthsItCouldFit: json['Earths it Could Fit'] is double || json['Earths it Could Fit'] is int? json['Earths it Could Fit'].toString() : json['Earths it Could Fit'],
      gravityLevels: json['Gravity Levels'] is double || json['Gravity Levels'] is int? json['Gravity Levels'].toString() : json['Gravity Levels'],
      oxygenLevels: json['Oxygen Levels'],
      nitrogenLevels: json['Nitrogen Levels'],
      discoveryYear: json['Discovery Year'] is int? json['Discovery Year'].toString() : json['Discovery Year'],
      age: json['Age (years)'] is double || json['Age (years)'] is int? json['Age (years)'].toString() : json['Age (years)'],
      starSystem: json['Star System'],
      galaxy: json['Galaxy'],
      interestingFacts: json['Interesting Facts'],
      atmosphericComposition: json.containsKey('Atmospheric Composition')? parseAtmosphericComposition(json['Atmospheric Composition']):[],
    );
  }
  static List<AtmosphericComposition> parseAtmosphericComposition(String atmosphericComposition) {
    List<AtmosphericComposition> result = [];

    // Split the atmospheric composition string (format: "percentage% element, percentage% element") into individual components (format: "percentage% element" and "percentage% element")
    List<String> components = atmosphericComposition.split(',');

    // Parse each component and extract the element and percentage
    for (var component in components) {
      List<String> parts = component.trim().split(' ');
      if (parts.length == 2) {
        String element = parts[1]; // Extract the element from the second part
        double percentage = double.tryParse(parts[0].replaceAll('%', '')) ?? 0.0; // Extract and parse the percentage
        result.add(AtmosphericComposition(element: element, percentage: percentage)); // Create AtmosphericComposition object and add to result list
      }
    }
    return result;
  }

}
