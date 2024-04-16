// pulsar_model.dart
class Pulsar {
  final int? id;
  final String? pulsarName;
  final String? period;
  final String? spinFrequency;
  final String? age;
  final String? distanceFromEarth;
  final String? associatedSupernovaRemnant;
  final int? discoveryYear;

  Pulsar({
    this.id,
    this.pulsarName,
    this.period,
    this.spinFrequency,
    this.age,
    this.distanceFromEarth,
    this.associatedSupernovaRemnant,
    this.discoveryYear,
  });

  factory Pulsar.fromJson(Map<String, dynamic> json) {
    return Pulsar(
      id: json['id'],
      pulsarName: json['ulsar Name'],
      period: json['Period (milliseconds)'],
      spinFrequency: json['Spin Frequency (Hz)'],
      age: json['Age (years)'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      associatedSupernovaRemnant: json['Associated Supernova Remnant'],
      discoveryYear: json['Discovery Year'],
    );
  }
}
