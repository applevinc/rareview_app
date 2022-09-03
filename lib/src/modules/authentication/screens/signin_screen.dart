import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/authentication/controllers/auth_controller.dart';
import 'package:rareview_app/src/modules/authentication/screens/signup_screen.dart';
import 'package:rareview_app/src/modules/authentication/widgets/base_auth_view.dart';
import 'package:rareview_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:rareview_app/src/shared/models/failure.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/utils/navigator.dart';
import 'package:rareview_app/src/shared/utils/notification_message.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';
import 'package:rareview_app/src/shared/widgets/buttons/custom_text_button.dart';
import 'package:rareview_app/src/shared/widgets/input/custom_textfield.dart';
import 'package:rareview_app/src/shared/widgets/input/password_textfield.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(authProvider.notifier);

      try {
        await controller.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
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
    final authState = ref.watch(authProvider);

    return BaseAuthView(
      title: 'Welcome',
      showClose: false,
      form: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              lableText: 'Email',
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 10.h),
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
              isLoading: authState == AuthState.loading,
              onTap: signIn,
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
                AppNavigator.to(context, const SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
