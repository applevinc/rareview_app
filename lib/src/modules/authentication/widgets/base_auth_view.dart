
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/spacing.dart';
import 'package:rareview_app/src/shared/styles/text.dart';

class BaseAuthView extends StatelessWidget {
  const BaseAuthView({
    Key? key,
    required this.title,
    required this.form,
    this.showClose = true,
    this.subtitle,
  }) : super(key: key);

  final Widget form;
  final bool showClose;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppPadding.symetricHorizontalOnly,
            child: Column(
              children: [
                showClose
                    ? Column(
                        children: [
                          SizedBox(height: 45.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                showClose ? SizedBox(height: 65.h) : SizedBox(height: 120.h),
                Text(
                  title,
                  style: AppText.bold800(context).copyWith(
                    fontSize: 40.sp,
                    color: AppColors.primary,
                  ),
                ),
                subtitle != null
                    ? SizedBox(
                        width: 260.w,
                        child: Column(
                          children: [
                            SizedBox(height: 8.h),
                            Text(
                              subtitle!,
                              textAlign: TextAlign.center,
                              style: AppText.bold700(context).copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                subtitle != null ? SizedBox(height: 106.h) : SizedBox(height: 100.h),
                form,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
