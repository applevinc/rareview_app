import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/spacing.dart';

Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget body,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  final size = MediaQuery.of(context).size.height;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    constraints: BoxConstraints(
      maxHeight: size,
    ),
    isDismissible: isDismissible,
    backgroundColor: Colors.transparent,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: body,
    ),
  );
}

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({
    Key? key,
    required this.content,
    this.padding,
    this.margin,
  }) : super(key: key);

  final List<Widget> content;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: margin,
        padding: padding ??
            EdgeInsets.only(
              top: 20.73.h,
              right: AppPadding.horizontal,
              left: AppPadding.horizontal,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
        ),
      ),
    );
  }
}

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            bottom: 10.46.h,
            right: 5.w,
          ),
          child: Icon(
            Icons.close,
            size: 20.sp,
            color: color,
          ),
        ),
      ),
    );
  }
}

class Dragger extends StatelessWidget {
  const Dragger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.5.w,
      height: 4.h,
      color: AppColors.border,
    );
  }
}
