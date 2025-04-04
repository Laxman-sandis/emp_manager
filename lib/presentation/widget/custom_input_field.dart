import 'package:emp_manager/core/app_color_style.dart';
import 'package:emp_manager/core/text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final String? iconAsset;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5),
      decoration: BoxDecoration(
        color: AppColorStyle.background(context),
        border: Border.all(color: AppColorStyle.textHint(context)),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(width: 28, height: 28, child: SvgPicture.asset(iconAsset!)),
          Expanded(
            child: TextField(
              controller: controller,
              maxLength: 50,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
              ],
              decoration: InputDecoration(
                hintText: hintText,
                counter: const SizedBox.shrink(),
                hintStyle: AppTextStyle.subTitleRegular(context, AppColorStyle.textHint(context)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(8.0),
              ),
              style: AppTextStyle.subTitleRegular(context, AppColorStyle.text(context)),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
