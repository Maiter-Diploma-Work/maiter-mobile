class AgeRange {
  final int max;
  final int min;

  AgeRange({required this.max, required this.min});

  factory AgeRange.fromJson(Map<String, dynamic> json) => AgeRange(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}
