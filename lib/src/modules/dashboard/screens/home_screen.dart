import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rareview_app/src/modules/dashboard/controllers/people_controller.dart';
import 'package:rareview_app/src/modules/dashboard/screens/add_edit_person_view.dart';
import 'package:rareview_app/src/shared/extensions/string.dart';
import 'package:rareview_app/src/shared/models/user.dart';
import 'package:rareview_app/src/shared/styles/colors.dart';
import 'package:rareview_app/src/shared/styles/spacing.dart';
import 'package:rareview_app/src/shared/styles/text.dart';
import 'package:rareview_app/src/shared/widgets/custom_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('People'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Text(
            'Tap to edit',
            style: AppText.bold300(context).copyWith(
              color: AppColors.primary,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 10.h),
          const _PeopleListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEditPersonBottomSheet(context);
        },
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _PeopleListView extends ConsumerWidget {
  const _PeopleListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<User> people = ref.watch(peopleProvider);
    return Expanded(
      child: ListView.separated(
        itemCount: people.length,
        physics: const BouncingScrollPhysics(),
        padding: AppPadding.symetricHorizontalOnly,
        itemBuilder: (context, index) {
          final person = people[index];
          return _PersonItem(person);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.h);
        },
      ),
    );
  }
}

class _PersonItem extends ConsumerWidget {
  const _PersonItem(this.person, {Key? key}) : super(key: key);

  final User person;

  void _delete(WidgetRef ref) {
    final controller = ref.read(peopleProvider.notifier);
    controller.delete(person);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        _showAddEditPersonBottomSheet(context, person: person);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    person.name.toTitleCase(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.bold700(context).copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _delete(ref),
                  child: const Icon(
                    Icons.delete_outline,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
            Text(
              person.email,
              style: AppText.bold300(context).copyWith(
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> _showAddEditPersonBottomSheet(BuildContext context, {User? person}) {
  return showCustomBottomSheet(
    context: context,
    body: AddEditPersonView(person: person),
  );
}
