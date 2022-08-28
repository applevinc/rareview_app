import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.labelColor,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: AppText.bold700(context).copyWith(
          fontSize: 16.sp,
          color: labelColor ?? AppColors.primary,
        ),
      ),
    );
  }
}
