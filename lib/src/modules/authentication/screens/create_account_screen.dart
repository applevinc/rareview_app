
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/authentication/screens/login_screen.dart';
import 'package:rareview_app/src/modules/authentication/widgets/base_auth_view.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/utils/navigator.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';
import 'package:rareview_app/src/shared/widgets/input/custom_textfield.dart';
import 'package:rareview_app/src/shared/widgets/input/password_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gap = 42.h;

    return BaseAuthView(
      title: 'Create Account',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _fullNameController,
              lableText: 'Full Name',
            ),
            SizedBox(height: gap),
            CustomTextField(
              controller: _emailController,
              lableText: 'Email',
            ),
            SizedBox(height: gap),
            CustomTextField(
              controller: _phoneNumberController,
              lableText: 'Phone Number',
              textInputType: TextInputType.number,
            ),
            SizedBox(height: gap),
            PasswordTextField(controller: _passwordController),
            SizedBox(height: 32.h),
            AppButton(
              label: 'Sign Up',
              onTap: () {},
            ),
            SizedBox(height: 44.h),
            Text(
              'Already have an account ?',
              style: AppText.bold300(context).copyWith(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                AppNavigator.to(context, const LoginScreen());
              },
              child: Text(
                'Sign In',
                style: AppText.bold700(context).copyWith(
                  fontSize: 16.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}
