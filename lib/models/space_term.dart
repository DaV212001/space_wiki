// space_term_model.dart
class SpaceTerm {
  final int id;
  final String term;
  final String definition;
  final String originators;
  final String age;
  final String partOfSpeech;

  SpaceTerm({
    required this.id,
    required this.term,
    required this.definition,
    required this.originators,
    required this.age,
    required this.partOfSpeech,
  });

  factory SpaceTerm.fromJson(Map<String, dynamic> json) {
    return SpaceTerm(
      id: json['id'],
      term: json['Term'],
      definition: json['Definition'],
      originators: json['Originator(s)'],
      age: json['Age'],
      partOfSpeech: json['Part of Speech'],
    );
  }
}
