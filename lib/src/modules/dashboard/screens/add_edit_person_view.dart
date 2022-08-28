import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/dashboard/controllers/people_controller.dart';
import 'package:rareview_app/src/shared/helper_functions/helper_functions.dart';
import 'package:rareview_app/src/shared/helper_functions/validator.dart';
import 'package:rareview_app/src/shared/models/user.dart';
import 'package:rareview_app/src/shared/utils/notification_message.dart';
import 'package:rareview_app/src/shared/widgets/buttons/app_button.dart';
import 'package:rareview_app/src/shared/widgets/custom_bottomsheet.dart';
import 'package:rareview_app/src/shared/widgets/input/custom_textfield.dart';

class AddEditPersonView extends ConsumerStatefulWidget {
  const AddEditPersonView({Key? key, this.person}) : super(key: key);

  final User? person;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<AddEditPersonView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final person = widget.person;
    if (person != null) {
      _userNameController = TextEditingController(text: person.name);
      _emailController = TextEditingController(text: person.email);
    } else {
      _userNameController = TextEditingController();
      _emailController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(peopleProvider.notifier);
      final person = widget.person;
      if (person != null) {
        controller.edit(
          id: person.id,
          name: _userNameController.text.trim(),
          email: _emailController.text.trim(),
        );
        NotificationMessage.showSucessSnackBar(
            message: 'Update successful', context: context);
      } else {
        controller.add(
          User(
            id: HelperFunctions.generateUniqueId(),
            name: _userNameController.text.trim(),
            email: _emailController.text.trim(),
          ),
        );
        NotificationMessage.showSucessSnackBar(
            message: 'Added successfully', context: context);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetBody(
      content: [
        const Dragger(),
        SizedBox(height: 40.h),
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextField(
                controller: _userNameController,
                lableText: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: _emailController,
                lableText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (Validator.isNotValidEmail(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40.h),
              AppButton(
                label: widget.person == null ? 'Submit' : 'Update',
                onTap: _submit,
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
