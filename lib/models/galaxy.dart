// galaxy_model.dart
class Galaxy {
  final int? id;
  final String? galaxyName;
  final String? distanceFromEarth;
  final String? distanceFromMilkyWayGalaxy;
  final String? diameter;
  final String? age;
  final String? discoveryYear;
  final String? numberOfPlanets;
  final String? numberOfStars;
  final String? notableSpaceObjects;
  final String? funFacts;

  Galaxy({
    this.id,
    this.galaxyName,
    this.distanceFromEarth,
    this.distanceFromMilkyWayGalaxy,
    this.diameter,
    this.age,
    this.discoveryYear,
    this.numberOfPlanets,
    this.numberOfStars,
    this.notableSpaceObjects,
    this.funFacts,
  });

  factory Galaxy.fromJson(Map<String, dynamic> json) {
    return Galaxy(
      id: json['id'],
      galaxyName: json['Galaxy Name'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      distanceFromMilkyWayGalaxy: json['Distance from Milky Way Galaxy (light years)'],
      diameter: json['Diameter (light years)'],
      age: json['Age (years)'],
      discoveryYear: json['Discovery Year'],
      numberOfPlanets: json['Number of Planets'],
      numberOfStars: json['Number of Stars'],
      notableSpaceObjects: json['Notable Space Objects'],
      funFacts: json['Fun Facts'],
    );
  }
}
