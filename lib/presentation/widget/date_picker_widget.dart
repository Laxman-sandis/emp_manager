import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/constants.dart';
import 'package:emp_manager/core/icons.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:emp_manager/logic/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DatePickerDialogWidget {
  static Future<DateTime?> show(
    BuildContext context,
    DateTime? selectedDate, {
    DateTime? minDate,
  }) async {
    DateTime? tempSelectedDate = selectedDate;

    return await showDialog<DateTime>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColorStyle.background(context),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, null);
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: AppColorStyle.primary(context),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: Text(
                                    selectedDate != null
                                        ? DateFormat.yMMMd().format(selectedDate)
                                        : AppConstants.noDate,
                                    style: AppTextStyle.detailsRegular(
                                        context, AppColorStyle.textWhite(context)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (minDate != null && DateTime.now().isBefore(minDate)) {
                                  AppSnackBar.show(
                                      context, "Select a date after ${minDate.toLocal()}");
                                  return;
                                }
                                Navigator.pop(context, DateTime.now());
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: AppColorStyle.primarySurface2(context),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Center(
                                  child: Text(AppConstants.today,
                                      style: AppTextStyle.subTitleRegular(
                                          context, AppColorStyle.primary(context))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 265,
                      child: BlocBuilder<ThemeCubit, bool>(
                        builder: (context, isDarkTheme) {
                          return Theme(
                            data: isDarkTheme
                                ? ThemeData.dark().copyWith(
                                    colorScheme: ColorScheme.dark(
                                      primary: AppColorStyle.primary(context),
                                      onPrimary: AppColorStyle.textWhite(context),
                                      onSurface: AppColorStyle.textWhite(context),
                                    ),
                                  )
                                : ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColorStyle.primary(context),
                                      onPrimary: AppColorStyle.textWhite(context),
                                      onSurface: AppColorStyle.text(context),
                                    ),
                                  ),
                            child: CalendarDatePicker(
                              initialDate: tempSelectedDate ?? DateTime.now(),
                              firstDate: minDate ?? DateTime(2000),
                              lastDate: DateTime(2100),
                              onDateChanged: (date) {
                                setState(() => tempSelectedDate = date);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      icon: SvgPicture.asset(IconsSVG.icEvent, height: 24, width: 24),
                      label: Text(
                        selectedDate != null
                            ? DateFormat.yMMMd().format(selectedDate)
                            : AppConstants.noDate,
                        style: AppTextStyle.detailsRegular(
                            context,
                            selectedDate != null
                                ? AppColorStyle.primary(context)
                                : AppColorStyle.text(context)),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: AppColorStyle.primarySurface2(context),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            child: Text(AppConstants.cancel,
                                style: AppTextStyle.subTitleMedium(
                                    context, AppColorStyle.primary(context))),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            tempSelectedDate = tempSelectedDate ?? DateTime.now();
                            if (minDate != null && tempSelectedDate!.isBefore(minDate)) {
                              AppSnackBar.show(context, "Select a date after ${minDate.toLocal()}");
                              return;
                            }
                            Navigator.pop(context, tempSelectedDate);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: AppColorStyle.primary(context),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            child: Text(
                              AppConstants.save,
                              style: AppTextStyle.subTitleMedium(
                                  context, AppColorStyle.textWhite(context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
