// galaxy_model.dart
class Galaxy {
  final int id;
  final String galaxyName;
  final String distanceFromEarth;
  final String distanceFromMilkyWayGalaxy;
  final String diameter;
  final String age;
  final String discoveryYear;
  final String numberOfPlanets;
  final String numberOfStars;
  final String notableSpaceObjects;
  final String funFacts;

  Galaxy({
    required this.id,
    required this.galaxyName,
    required this.distanceFromEarth,
    required this.distanceFromMilkyWayGalaxy,
    required this.diameter,
    required this.age,
    required this.discoveryYear,
    required this.numberOfPlanets,
    required this.numberOfStars,
    required this.notableSpaceObjects,
    required this.funFacts,
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
