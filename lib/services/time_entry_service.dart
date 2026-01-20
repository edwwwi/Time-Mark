import 'package:hive/hive.dart';
import 'package:time_mark/models/time_entry.dart';

class TimeEntryService {
  static const String boxName = 'time_entries';

  // Get the opened box
  static Box<TimeEntry> getBox() {
    return Hive.box<TimeEntry>(boxName);
  }

  // Add new entry
  static Future<void> addEntry(TimeEntry entry) async {
    final box = getBox();
    await box.put(entry.id, entry);
  }

  // Update existing entry
  static Future<void> updateEntry(TimeEntry entry) async {
    final box = getBox();
    await box.put(entry.id, entry);
  }

  // Delete entry
  static Future<void> deleteEntry(String id) async {
    final box = getBox();
    await box.delete(id);
  }

  // Get entries for a specific date
  static List<TimeEntry> getEntriesForDate(DateTime date) {
    final box = getBox();
    // Normalize input date to midnight just in case
    final targetDate = DateTime(date.year, date.month, date.day);
    
    final entries = box.values.where((entry) {
      return entry.date.year == targetDate.year &&
             entry.date.month == targetDate.month &&
             entry.date.day == targetDate.day;
    }).toList();

    // Sort by time
    entries.sort((a, b) => a.time.compareTo(b.time));
    return entries;
  }
}
