import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/authentication/controllers/auth_controller.dart';
import 'package:rareview_app/src/modules/authentication/screens/signin_screen.dart';
import 'package:rareview_app/src/modules/authentication/widgets/base_auth_view.dart';
import 'package:rareview_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:rareview_app/src/shared/models/failure.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/utils/navigator.dart';
import 'package:rareview_app/src/shared/utils/notification_message.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';
import 'package:rareview_app/src/shared/widgets/input/custom_textfield.dart';
import 'package:rareview_app/src/shared/widgets/input/password_textfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(authProvider.notifier);

      try {
        await controller.signUp(
          name: _fullNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
        NotificationMessage.showSucess(
            message: 'Account creation success', context: context);
        AppNavigator.pushAndRemoveUntil(context, const DashboardView());
      } on Failure {
        NotificationMessage.showError(
            message: 'Failed to create an account', context: context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final gap = 10.h;
    final authState = ref.watch(authProvider);

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
            PasswordTextField(controller: _passwordController),
            SizedBox(height: 32.h),
            AppButton(
              label: 'Sign Up',
              isLoading: authState == AuthState.loading,
              onTap: signUp,
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
                AppNavigator.to(context, const SignInScreen());
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
