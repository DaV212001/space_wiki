///***Supabase Table Definition***
///
/// ```sql
///create table
///  public."Space_Terms" (
///    "Term" text null,
///    "Definition" text null,
///    "Originator(s)" text null,
///    "Age" text null,
///    "Part of Speech" text null,
///    id bigint generated by default as identity not null,
///    constraint Space_Terms_pkey primary key (id),
///    constraint Space_Terms_id_key unique (id)
///  ) tablespace pg_default;
/// ```
class SpaceTerm {
  final int? id;
  final String? term;
  final String? definition;
  final String? originators;
  final String? age;
  final String? partOfSpeech;

  SpaceTerm({
    this.id,
    this.term,
    this.definition,
    this.originators,
    this.age,
    this.partOfSpeech,
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
