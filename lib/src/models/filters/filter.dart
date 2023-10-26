import 'package:amica/src/models/filters/range.dart';

abstract class Filter {
  final int id;
  final int userId;
  final double distance;
  final Range age;
  final String lookingFor;

  Filter({
    required this.id,
    required this.userId,
    required this.distance,
    required this.age,
    required this.lookingFor,
  });
}
