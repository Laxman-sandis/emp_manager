import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/constants.dart';
import 'package:emp_manager/core/icons.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:emp_manager/logic/cubit/theme_cubit.dart';
import 'package:emp_manager/presentation/widget/custom_input_field.dart';
import 'package:emp_manager/presentation/widget/date_picker_widget.dart';
import 'package:emp_manager/presentation/widget/dropdown_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../logic/cubit/employee_cubit.dart';
import '../../data/models/employee_model.dart';

class EmployeeFormScreen extends StatefulWidget {
  final EmployeeModel? employee;
  final bool? isEdit;

  const EmployeeFormScreen({super.key, this.employee, this.isEdit});

  @override
  EmployeeFormScreenState createState() => EmployeeFormScreenState();
}

class EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _nameController = TextEditingController();
  String? selectedRole; // Holds the selected role
  DateTime? _startDate = DateTime.now();
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _nameController.text = widget.employee!.name;
      selectedRole = widget.employee!.role;
      _startDate = widget.employee!.startDate;
      _endDate = widget.employee!.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColorStyle.background(context),
          appBar: AppBar(
              automaticallyImplyLeading: false, // Removes the back arrow
              title: Text(AppConstants.addEmpDetails,
                  style: AppTextStyle.titleMedium(context, AppColorStyle.textWhite(context)))),
          body: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomInputField(
                        hintText: AppConstants.empName,
                        controller: _nameController,
                        iconAsset: IconsSVG.icPerson,
                        onChanged: (value) {}),
                    const SizedBox(height: 15),
                    CustomDropdownBottomSheet(
                      selectedRole: selectedRole,
                      onChanged: (String role) => {
                        setState(() {
                          selectedRole = role;
                        })
                      }, // Pass the function to update state
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              DateTime? pickedDate =
                                  await DatePickerDialogWidget.show(context, _startDate);
                              if (pickedDate != null) {
                                setState(() =>
                                    _startDate = pickedDate); // Update state if date is selected
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: AppColorStyle.background(context),
                                  border: Border.all(color: AppColorStyle.textHint(context)),
                                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(IconsSVG.icEvent),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    _startDate != null
                                        ? _startDate!.difference(DateTime.now()).inDays == 0
                                            ? "Today"
                                            : DateFormat.yMMMd().format(_startDate!)
                                        : AppConstants.startDate,
                                    style: AppTextStyle.subTitleRegular(
                                        context, AppColorStyle.text(context)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.arrow_right_alt, color: Colors.blue, size: 30),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              if (_startDate == null) {
                                AppSnackBar.show(context, AppConstants.selectDateError);
                                return;
                              }
                              DateTime? pickedDate = await DatePickerDialogWidget.show(
                                  context, _endDate,
                                  minDate: _startDate);
                              if (pickedDate != null) {
                                setState(
                                    () => _endDate = pickedDate); // Update state if date is selected
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: AppColorStyle.background(context),
                                  border: Border.all(color: AppColorStyle.textHint(context)),
                                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(IconsSVG.icEvent),
                                  const SizedBox(width: 8.0),
                                  Text(
                                      softWrap: true,
                                      _endDate != null
                                          ? DateFormat.yMMMd().format(_endDate!)
                                          : AppConstants.noDate,
                                      style: _endDate != null
                                          ? AppTextStyle.subTitleRegular(
                                              context, AppColorStyle.text(context))
                                          : AppTextStyle.subTitleRegular(
                                              context, AppColorStyle.textHint(context))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(height: 1, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: AppColorStyle.primarySurface2(context),
                                borderRadius: const BorderRadius.all(Radius.circular(5))),
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                            child: Text(AppConstants.cancel,
                                style: AppTextStyle.subTitleBold(
                                    context, AppColorStyle.primary(context))),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () => _saveEmployee(),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: AppColorStyle.primary(context),
                                borderRadius: const BorderRadius.all(Radius.circular(5))),
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                            child: Text(
                              AppConstants.save,
                              style: AppTextStyle.subTitleBold(
                                  context, AppColorStyle.textWhite(context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveEmployee() {
    if (_nameController.text.isEmpty) {
      AppSnackBar.show(context, AppConstants.empNameError);
      return;
    }

    if (selectedRole == null) {
      AppSnackBar.show(context, AppConstants.selectRole);
      return;
    }

    if (_startDate == null) {
      AppSnackBar.show(context, AppConstants.selectDate);
      return;
    }

    if (widget.isEdit != null && widget.isEdit! && widget.employee != null) {
      final newEmployee = EmployeeModel(
        id: widget.employee!.id,
        name: _nameController.text,
        role: selectedRole!,
        startDate: _startDate!,
        endDate: _endDate,
      );
      context.read<EmployeeCubit>().updateEmployee(newEmployee);
    } else {
      final newEmployee = EmployeeModel(
        name: _nameController.text,
        role: selectedRole!,
        startDate: _startDate!,
        endDate: _endDate,
      );
      context.read<EmployeeCubit>().addEmployee(newEmployee);
    }

    Navigator.pop(context);
  }

  @override
  dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
