import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String appTitle = "Employee Manager";
  static const String empList = "Employee List";
  static const String addEmpDetails = "Add Employee Details";
  static const String noDate = "No date";
  static const String startDate = "Today";
  static const String empName = "Employee Name";
  static const String cancel = "Cancel";
  static const String save = "Save";
  static const String today = "Today";
  static const String swipeLeftToDelete = "Swipe left to delete";
  static const String empSelectRole = "Select role";

  // Employee roles
  static const String currentEmp = "Current Employees";
  static const String previousEmp = "Previous Employees";

  // Database box name
  static const String employeeBox = "employeeBox";
  static const String settingsBox = "settings";

  // Error messages
  static const String empNameError = "Please enter employee name!";
  static const String deleteMessage = "Employee data has been deleted.";
  static const String selectRole = "Please select a role!";
  static const String selectDate = "Please select a start date!";
  static const String selectDateError = "Please select a start date first";


}

class AppSnackBar {
  static void show(BuildContext context, String message, {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.subTitleMedium(context, AppColorStyle.textWhite(context)),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
