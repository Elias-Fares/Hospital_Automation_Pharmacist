part of '../edit_work_days_screen.dart';

class AddWorkDayDialog extends ConsumerWidget {
  const AddWorkDayDialog({super.key});

  static void builder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddWorkDayDialog(),
    );
  }

  final List<String> daysOfWeek = const [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  String _to24hString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  Future<void> _pickTime(
    BuildContext context,
    WidgetRef ref,
    bool isOpen,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      if (isOpen) {
        ref
            .read(editWorkDaysViewModelProvider.notifier)
            .selectOpenTime(_to24hString(picked));
      } else {
        ref
            .read(editWorkDaysViewModelProvider.notifier)
            .selectCloseTime(_to24hString(picked));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editWorkDaysViewModelProvider);

    ref.listen(
      editWorkDaysViewModelProvider.select((value) => value.addWorkDay),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(
              context,
              message: "Work Day Added Successfully",
            );
            context.pop();
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );

    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              "Add Work Day",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),

            // Select Day
            DropdownButtonFormField<String>(
              initialValue: state.day,
              items:
                  daysOfWeek.map((day) {
                    return DropdownMenuItem(value: day, child: Text(day));
                  }).toList(),
              hint: const Text("Select Day"),
              focusColor: AppColors.white,
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(editWorkDaysViewModelProvider.notifier)
                      .selectDay(value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Open Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Opens at:"),
                TextButton(
                  onPressed: () => _pickTime(context, ref, true),
                  child: Text(state.openTime ?? "Choose"),
                ),
              ],
            ),

            // Close Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Closes at:"),
                TextButton(
                  onPressed: () => _pickTime(context, ref, false),
                  child: Text(state.closeTime ?? "Choose"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: CustomOutlinedButton(
                    onTap: () => Navigator.pop(context), // cancel
                    title: "Cancel",
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: LoadingButton(
                    isLoading: state.addWorkDay?.isLoading ?? false,
                    onTap: () {
                      ref
                          .read(editWorkDaysViewModelProvider.notifier)
                          .addWorkDay();
                    },
                    title: "Save",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
