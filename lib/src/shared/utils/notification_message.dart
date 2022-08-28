import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NotificationMessage {
  static TextStyle textStyle(BuildContext context) {
    return AppText.bold500(context).copyWith(
      color: Colors.white,
      fontSize: 15.sp,
    );
  }

  static EdgeInsetsGeometry margin() {
    return EdgeInsets.symmetric(
      horizontal: 10.w,
      vertical: 10.h,
    );
  }

  static showSnackBar({
    required String message,
    required BuildContext context,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.info(
        message: message,
      ),
    );
  }

  static showErrorSnackBar({
    required String message,
    required BuildContext context,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static showSucessSnackBar({
    required String message,
    required BuildContext context,
  }) {
    snackBar(
      context,
      child: CustomSnackBar.success(
        message: message,
      ),
    );
  }

  static snackBar(BuildContext context, {required Widget child}) {
    showTopSnackBar(
      context,
      child,
    );
  }
}
