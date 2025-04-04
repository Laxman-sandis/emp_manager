import 'package:emp_manager/data/local_db.dart';
import 'package:emp_manager/data/models/employee_model.dart';
import 'package:emp_manager/logic/cubit/employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  /// Load all employees from Hive
  void loadEmployees() {
    final employees = LocalDB.employeeBox.values.toList();
    emit(EmployeeLoaded(employees));
  }

  /// Add a new employee
  Future<void> addEmployee(EmployeeModel employee) async {
    int newId = await LocalDB.getNextId();
    EmployeeModel newEmployee = EmployeeModel(
      id: newId,
      name: employee.name,
      role: employee.role,
      startDate: employee.startDate,
      endDate: employee.endDate,
    );

    await LocalDB.employeeBox.put(newId, newEmployee);
    loadEmployees();
  }

  /// Update an existing employee using their ID
  Future<void> updateEmployee(EmployeeModel employee) async {
    if (LocalDB.employeeBox.containsKey(employee.id)) {
      await LocalDB.employeeBox.put(employee.id, employee);
      loadEmployees();
    }
  }

  /// Delete an employee using their ID
  Future<void> deleteEmployee(int id) async {
    if (LocalDB.employeeBox.containsKey(id)) {
      await LocalDB.employeeBox.delete(id);
      loadEmployees();
    }
  }
}
