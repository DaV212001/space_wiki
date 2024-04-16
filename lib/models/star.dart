// star_model.dart
class Star {
  final int? id;
  final String? starName;
  final String? age;
  final String? timeBeforeDeath;
  final String? size;
  final String? earthsItCouldFit;
  final String? distanceFromEarth;
  final String? discoveryYear;
  final String? galaxy;
  final String? starType;
  final String? sunsItCouldFit;
  final String? interestingFact;

  Star({
    this.id,
    this.starName,
    this.age,
    this.timeBeforeDeath,
    this.size,
    this.earthsItCouldFit,
    this.distanceFromEarth,
    this.discoveryYear,
    this.galaxy,
    this.starType,
    this.sunsItCouldFit,
    this.interestingFact,
  });

  factory Star.fromJson(Map<String, dynamic> json) {
    return Star(
      id: json['id'],
      starName: json['Star Name'],
      age: json['Age (years)'],
      timeBeforeDeath: json['Time before Death'],
      size: json['Size'],
      earthsItCouldFit: json['Earths it Could Fit'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      discoveryYear: json['Discovery Year'],
      galaxy: json['Galaxy'],
      starType: json['Star Type'],
      sunsItCouldFit: json['Suns it Could Fit'],
      interestingFact: json['Interesting Fact'],
    );
  }
}
