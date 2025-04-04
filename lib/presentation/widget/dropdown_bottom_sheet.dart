import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/constants.dart';
import 'package:emp_manager/core/icons.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownBottomSheet extends StatefulWidget {
  final String? selectedRole;
  final Function(String) onChanged; // Callback function to notify parent

  const CustomDropdownBottomSheet({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });

  @override
  CustomDropdownBottomSheetState createState() => CustomDropdownBottomSheetState();
}

class CustomDropdownBottomSheetState extends State<CustomDropdownBottomSheet> {
  final List<String> roles = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner"
  ];

  void _showRoleSelection(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColorStyle.background(context),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            // Ensure it takes only necessary space
            itemCount: roles.length,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(thickness: 0.5),
            // Add Divider
            itemBuilder: (context, index) {
              final role = roles[index];
              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: index == 0 ? 15 : 0),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Center(
                    child: Text(
                      role,
                      style: widget.selectedRole == role
                          ? AppTextStyle.subTitleBold(context, AppColorStyle.primary(context))
                          : AppTextStyle.subTitleRegular(context, AppColorStyle.text(context)),
                    ),
                  ),
                  onTap: () {
                    widget.onChanged(role); // Notify parent screen
                    Navigator.pop(context); // Close BottomSheet
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColorStyle.background(context),
          border: Border.all(color: AppColorStyle.textHint(context)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: InkWell(
        onTap: () => _showRoleSelection(context), // Open BottomSheet on tap
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(IconsSVG.icWork),
                const SizedBox(width: 10),
                Text(widget.selectedRole ?? AppConstants.empSelectRole,
                    style: AppTextStyle.subTitleRegular(
                        context,
                        widget.selectedRole != null
                            ? AppColorStyle.text(context)
                            : AppColorStyle.textHint(context))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset(IconsSVG.icDropdown),
            ),
          ],
        ),
      ),
    );
  }
}
