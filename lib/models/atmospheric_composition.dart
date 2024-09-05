class AtmosphericComposition {
  final String element;
  final double percentage;

  AtmosphericComposition({required this.element, required this.percentage});

  factory AtmosphericComposition.fromJson(Map<String, dynamic> json) {
    return AtmosphericComposition(
      element: json['element'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'element': element,
      'percentage': percentage,
    };
  }
}

