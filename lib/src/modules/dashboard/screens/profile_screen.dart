import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/spacing.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: AppPadding.defaultPadding,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: AppColors.boxshadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'User Detail',
                        style: AppText.bold700(context).copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Text(
                      'Name:',
                      style: AppText.bold300(context).copyWith(
                        fontSize: 11.sp,
                      ),
                    ),
                    Text(
                      'Jane',
                      style: AppText.bold500(context).copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'email:',
                      style: AppText.bold300(context).copyWith(
                        fontSize: 11.sp,
                      ),
                    ),
                    Text(
                      'jane@gmail.com',
                      style: AppText.bold500(context).copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              AppButton(
                label: 'Logout',
                backgroundColor: AppColors.error,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
