import '../../data/models/employee_model.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeModel> employees;

  EmployeeLoaded(this.employees);
}
