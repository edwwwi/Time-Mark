import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'time_entry.g.dart';

@HiveType(typeId: 0)
class TimeEntry extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime date; // Normalized to midnight for easy grouping

  @HiveField(2)
  final String time; // H:m format for display and sorting (e.g., "09:30", "21:45")

  @HiveField(3)
  String text;

  TimeEntry({
    String? id,
    required this.date,
    required this.time,
    required this.text,
  }) : id = id ?? const Uuid().v4();
}
