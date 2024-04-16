// galaxy_cluster_model.dart
class GalaxyCluster {
  final int? id;
  final String? galaxyClusterName;
  final String? numberOfGalaxies;
  final String? totalMass;
  final String? distanceFromEarth;
  final String? notableMemberGalaxies;
  final String? discoveryYear;

  GalaxyCluster({
    this.id,
    this.galaxyClusterName,
    this.numberOfGalaxies,
    this.totalMass,
    this.distanceFromEarth,
    this.notableMemberGalaxies,
    this.discoveryYear,
  });

  factory GalaxyCluster.fromJson(Map<String, dynamic> json) {
    return GalaxyCluster(
      id: json['id'],
      galaxyClusterName: json['Galaxy Cluster Name'],
      numberOfGalaxies: json['Number of Galaxies'],
      totalMass: json['Total Mass (Solar Masses)'],
      distanceFromEarth: json['Distance from Earth (million light years)'],
      notableMemberGalaxies: json['Notable Member Galaxies'],
      discoveryYear: json['Discovery Year'],
    );
  }
}
