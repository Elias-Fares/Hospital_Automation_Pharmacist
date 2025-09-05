import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/features/edit_work_days/view_model/edit_work_days_view_model.dart';
part 'widget/work_days_header.dart';
part 'widget/work_day_card.dart';
part 'widget/add_work_day_dialog.dart';

class EditWorkDaysScreen extends ConsumerStatefulWidget {
  const EditWorkDaysScreen({super.key});
  static const routeName = "/edit_work_days_screen";

  @override
  ConsumerState<EditWorkDaysScreen> createState() => _EditWorkDaysScreenState();
}

class _EditWorkDaysScreenState extends ConsumerState<EditWorkDaysScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(editWorkDaysViewModelProvider.notifier).fetchWorkDays();
    });
  }

  @override
  Widget build(BuildContext context) {
    final workScheduleState = ref.watch(editWorkDaysViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            WorkDaysHeader(
              onAddTap: () {
                AddWorkDayDialog.builder(context);
              },
            ),
            SizedBox(height: 15),

            workScheduleState.workDaysResponse?.when(
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final workDay = data.elementAt(index);
                        return WorkDayCard(
                          day: workDay.day ?? "",
                          schedule:
                              "${workDay.workStartTime} - ${workDay.workEndTime}",

                          onDeleteTap: () {},
                          onEditTap: () {},
                        );
                      },
                    );
                  },
                  error:
                      (error, stackTrace) => CustomErrorWidget(
                        message: error.toString(),
                        height: 400.h,
                        onTryAgainTap: () {
                          ref
                              .read(editWorkDaysViewModelProvider.notifier)
                              .fetchWorkDays();
                        },
                      ),
                  loading: () => CustomLoadingWidget(height: 400.h),
                ) ??
                SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
