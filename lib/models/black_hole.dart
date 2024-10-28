// black_hole_model.dart

///***Supabase Table Definition***
///
///```sql
///create table
///   public."Black_Holes" (
///     "Black Hole Name" text null,
///     "Size" text null,
///     "Discovery Year" bigint null,
///     "Distance from Earth (light years)" text null,
///     "Distance from Milky Way Galaxy (light years)" text null,
///     "Age (years)" text null,
///     "Lifespan (estimated)" text null,
///     "Average Accretion Rate (solar masses per year)" text null,
///     "Spin (angular momentum)" text null,
///     "Interesting Fact" text null,
///     id bigint generated by default as identity not null,
///     constraint Black_Holes_pkey primary key (id),
///     constraint Black_Holes_id_key unique (id)
///   ) tablespace pg_default;
///   ```
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
      distanceFromMilkyWayGalaxy:
          json['Distance from Milky Way Galaxy (light years)'],
      age: json['Age (years)'],
      lifespan: json['Lifespan (estimated)'],
      averageAccretionRate:
          json['Average Accretion Rate (solar masses per year)'],
      spin: json['Spin (angular momentum)'],
      interestingFact: json['Interesting Fact'],
    );
  }
}
