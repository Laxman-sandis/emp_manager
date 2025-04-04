import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/constants.dart';
import 'package:emp_manager/core/icons.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:emp_manager/data/models/employee_model.dart';
import 'package:emp_manager/logic/cubit/theme_cubit.dart';
import 'package:emp_manager/presentation/screens/emp_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../logic/cubit/employee_cubit.dart';
import '../../logic/cubit/employee_state.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyle.background(context),
        appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.light_mode),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
            title: Text(AppConstants.empList,
                style: AppTextStyle.titleMedium(context, AppColorStyle.textWhite(context)))),
        body: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoaded) {
              if (state.employees.isEmpty) {
                return Center(
                  child: SvgPicture.asset(
                    IconsSVG.empNoData,
                  ),
                );
              }
              return _buildEmployeeList(context, state.employees);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: AppColorStyle.primary(context)),
          ),
          onPressed: () => navigateWithSlide(context, const EmployeeFormScreen()),
          child: const Icon(Icons.add, size: 25),
        ),
      ),
    );
  }

  void navigateWithSlide(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, animation, __) => page,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      height: 60,
      padding: const EdgeInsets.all(15),
      color: AppColorStyle.surface(context),
      child: Text(
        title,
        style: AppTextStyle.subTitleMedium(context, AppColorStyle.primary(context)),
      ),
    );
  }

  Widget _buildEmployeeList(BuildContext context, List<EmployeeModel> employees) {
    List<EmployeeModel> currentEmployees = employees.where((e) => e.endDate == null).toList();
    List<EmployeeModel> pastEmployees = employees.where((e) => e.endDate != null).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (currentEmployees.isNotEmpty) ...[
          _sectionHeader(context, AppConstants.currentEmp),
          _employeeList(context, currentEmployees),
        ],

        if (pastEmployees.isNotEmpty) ...[
          _sectionHeader(context, AppConstants.previousEmp),
          _employeeList(context, pastEmployees),
        ],

        /// "Swipe left to delete" message
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
          child: Text(
            AppConstants.swipeLeftToDelete,
            textAlign: TextAlign.center,
            style: AppTextStyle.subTitleMedium(context, AppColorStyle.textHint(context)),
          ),
        ),
      ],
    );
  }

  Widget _employeeList(BuildContext context, List<EmployeeModel> employees) {
    return Expanded(
      child: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          DateFormat inputFormat = DateFormat("d MMM, yyyy");
          String startDate = inputFormat.format(employees[index].startDate);
          String? endDate;

          if (employees[index].endDate != null) {
            endDate = inputFormat.format(employees[index].endDate!);
          }

          return Slidable(
            key: ValueKey(employees[index].name),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                    onPressed: (context) {
                      context.read<EmployeeCubit>().deleteEmployee(employees[index].id ?? 0);
                      AppSnackBar.show(context, AppConstants.deleteMessage,
                          backgroundColor: AppColorStyle.text(context));
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => navigateWithSlide(
                      context, EmployeeFormScreen(employee: employees[index], isEdit: true)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                      title: Text(
                        employees[index].name,
                        style: AppTextStyle.titleMedium(context, AppColorStyle.text(context)),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            employees[index].role,
                            style: AppTextStyle.subTitleRegular(
                                context, AppColorStyle.textHint(context)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            endDate != null ? "$startDate - $endDate" : "From $startDate",
                            style: AppTextStyle.detailsRegular(
                                context, AppColorStyle.textHint(context)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                index == employees.length - 1
                    ? Container()
                    : const Divider(height: 1, thickness: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
