class Range {
  final int max;
  final int min;

  Range({required this.max, required this.min});

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}
