import 'package:hive_flutter/hive_flutter.dart';
import '../core/constants.dart';
import 'models/employee_model.dart';

class LocalDB {
  /// Initialize Hive Boxes
  static Future<void> init() async {
    Hive.registerAdapter(EmployeeModelAdapter());

    await Hive.openBox<EmployeeModel>(AppConstants.employeeBox); // Employees
    await Hive.openBox<int>(AppConstants.settingsBox); // Settings (last ID)
  }

  /// Get employee box
  static Box<EmployeeModel> get employeeBox => Hive.box<EmployeeModel>(AppConstants.employeeBox);

  /// Get settings box
  static Box<int> get settingsBox => Hive.box<int>(AppConstants.settingsBox);

  /// Generate a unique auto-incrementing ID
  static Future<int> getNextId() async {
    int lastId = settingsBox.get('lastId', defaultValue: 0) ?? 0;
    lastId++;
    await settingsBox.put('lastId', lastId);
    return lastId;
  }
}
