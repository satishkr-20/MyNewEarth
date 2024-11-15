import 'package:hive_flutter/hive_flutter.dart';
import '../app/model/offering_model.dart';

class HiveService {
  static late Box _box;

  /// Initializes Hive and opens the box.
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(OfferingModelAdapter());
    _box = await Hive.openBox('offeringsBox');
  }

  /// Reads data from the box by key.
  static T? read<T>(dynamic key) {
    try {
      return _box.get(key) as T?;
    } catch (e) {
      print("Error reading from Hive: $e");
      return null;
    }
  }

  /// Writes data to the box with a key.
  static Future<void> write<T>(dynamic key, T value) async {
    try {
      await _box.put(key, value);
    } catch (e) {
      print("Error writing to Hive: $e");
    }
  }

  /// Closes the Hive box.
  static Future<void> close() async {
    await _box.close();
  }

  /// Clears all data in the Hive box.
  static Future<void> clear() async {
    await _box.clear();
  }

  /// Deletes a single entry by key.
  static Future<void> delete(dynamic key) async {
    try {
      await _box.delete(key);
    } catch (e) {
      print("Error deleting from Hive: $e");
    }
  }
}
