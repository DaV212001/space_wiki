// planet_model.dart
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
  final int? discoveryYear;
  final String? age;
  final String? starSystem;
  final String? galaxy;
  final String? interestingFacts;

  Planet({
     this.id,
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
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      id: json['id'],
      planetName: json['planet_name'],
      size: json['Size'],
      type: json['Type'],
      suitabilityForLife: json['Suitability for Life'],
      distanceFromEarth: json['Distance from Earth (light years)'] is double || json['Distance from Earth (light years)'] is int? json['Distance from Earth (light years)'].toString() : json['Distance from Earth (light years)'],
      earthsItCouldFit: json['Earths it Could Fit'],
      gravityLevels: json['Gravity Levels'],
      oxygenLevels: json['Oxygen Levels'],
      nitrogenLevels: json['Nitrogen Levels'],
      discoveryYear: json['Discovery Year'],
      age: json['Age (years)'],
      starSystem: json['Star System'],
      galaxy: json['Galaxy'],
      interestingFacts: json['Interesting Facts'],
    );
  }
}
