// interstellar_cloud_model.dart
class InterstellarCloud {
  final int? id;
  final String? cloudName;
  final String? type;
  final String? size;
  final String? distanceFromEarth;
  final String? discoveryYear;
  final String? interestingFacts;

  InterstellarCloud({
    this.id,
    this.cloudName,
    this.type,
    this.size,
    this.distanceFromEarth,
    this.discoveryYear,
    this.interestingFacts,
  });

  factory InterstellarCloud.fromJson(Map<String, dynamic> json) {
    return InterstellarCloud(
      id: json['id'],
      cloudName: json['Cloud Name'],
      type: json['Type'],
      size: json['Size (light years)'],
      distanceFromEarth: json['Distance from Earth (light years)'],
      discoveryYear: json['Discovery Year'],
      interestingFacts: json['Interesting Facts'],
    );
  }
}
