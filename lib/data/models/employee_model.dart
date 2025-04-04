import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  final int? id; // Primary key

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String role;

  @HiveField(3)
  final DateTime startDate;

  @HiveField(4)
  final DateTime? endDate;

  EmployeeModel({
    this.id, // Auto-incrementing ID
    required this.name,
    required this.role,
    required this.startDate,
    this.endDate,
  });
}
