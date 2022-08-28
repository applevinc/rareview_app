import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/authentication/screens/create_account_screen.dart';
import 'package:rareview_app/src/modules/authentication/widgets/base_auth_view.dart';
import 'package:rareview_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/utils/navigator.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';
import 'package:rareview_app/src/shared/widgets/buttons/custom_text_button.dart';
import 'package:rareview_app/src/shared/widgets/input/custom_textfield.dart';
import 'package:rareview_app/src/shared/widgets/input/password_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      title: 'Welcome',
      showClose: false,
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              lableText: 'Email',
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 30.h),
            PasswordTextField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomTextButton(
                label: 'Forgot Password ?',
                onTap: () {
                  //AppNavigator.to(context, const ForgotPasswordScreen());
                },
              ),
            ),
            SizedBox(height: 54.h),
            AppButton(
              label: 'Sign In',
              onTap: () {
                AppNavigator.to(context, const DashboardView());
              },
            ),
            SizedBox(height: 44.h),
            Text(
              'Don’t have an account ?',
              style: AppText.bold300(context).copyWith(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            CustomTextButton(
              label: 'Sign Up',
              onTap: () {
                AppNavigator.to(context, const CreateAccountScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
