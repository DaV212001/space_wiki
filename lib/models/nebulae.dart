// nebula_model.dart
class Nebula {
  final int? id;
  final String? nebulaName;
  final String? type;
  final String? distanceFromEarth;
  final String? diameter;
  final String? composition;
  final String? notableFeatures;
  final String? discoveryYear;

  Nebula({
    this.id,
    this.nebulaName,
    this.type,
    this.distanceFromEarth,
    this.diameter,
    this.composition,
    this.notableFeatures,
    this.discoveryYear,
  });

  factory Nebula.fromJson(Map<String, dynamic> json) {
    return Nebula(
      id: json['id'],
      nebulaName: json['Nebula Name'],
      type: json['Type'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      diameter: json['Diameter (light years)'],
      composition: json['Composition'],
      notableFeatures: json['Notable Features'],
      discoveryYear: json['Discovery Year'],
    );
  }
}
