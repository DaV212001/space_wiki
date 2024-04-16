// black_hole_model.dart
class BlackHole {
  final int? id;
  final String? blackHoleName;
  final String? size;
  final int? discoveryYear;
  final String? distanceFromEarth;
  final String? distanceFromMilkyWayGalaxy;
  final String? age;
  final String? lifespan;
  final String? averageAccretionRate;
  final String? spin;
  final String? interestingFact;

  BlackHole({
    this.id,
    this.blackHoleName,
    this.size,
    this.discoveryYear,
    this.distanceFromEarth,
    this.distanceFromMilkyWayGalaxy,
    this.age,
    this.lifespan,
    this.averageAccretionRate,
    this.spin,
    this.interestingFact,
  });

  factory BlackHole.fromJson(Map<String, dynamic> json) {
    return BlackHole(
      id: json['id'],
      blackHoleName: json['Black Hole Name'],
      size: json['Size'],
      discoveryYear: json['Discovery Year'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      distanceFromMilkyWayGalaxy: json['Distance from Milky Way Galaxy (light years)'],
      age: json['Age (years)'],
      lifespan: json['Lifespan (estimated)'],
      averageAccretionRate: json['Average Accretion Rate (solar masses per year)'],
      spin: json['Spin (angular momentum)'],
      interestingFact: json['Interesting Fact'],
    );
  }
}
