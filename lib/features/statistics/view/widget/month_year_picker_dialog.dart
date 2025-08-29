part of "../statistics_screen.dart";

class MonthYearPickerDialog extends ConsumerStatefulWidget {
  const MonthYearPickerDialog({super.key});

  static Future<DateTime?> builder(BuildContext context) async {
    final dateTime = await showDialog<DateTime>(
      context: context,
      barrierDismissible: false,
      builder: (context) => MonthYearPickerDialog(),
    );

    return dateTime;
  }

  @override
  ConsumerState<MonthYearPickerDialog> createState() =>
      _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends ConsumerState<MonthYearPickerDialog> {
  late final List<String> months;

  late final List<int> yearsList;

  late final FixedExtentScrollController _monthController;
  late final FixedExtentScrollController _yearController;

  late int selectedMonth;

  late int selectedYear;

  @override
  void initState() {
    super.initState();

    final currentDate = DateTime.now();

    months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    yearsList = List.generate(41, (index) => (index + 2000));

    final monthIndex = currentDate.month - 1;

    selectedMonth = currentDate.month;

    final yearIndex = yearsList.indexOf(currentDate.year);

    selectedYear = currentDate.year;

    _monthController = FixedExtentScrollController(initialItem: monthIndex);
    _yearController = FixedExtentScrollController(initialItem: yearIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      insetPadding: EdgeInsets.symmetric(horizontal: 30),
      backgroundColor: AppColors.backgroundColor,

      child: Container(
        padding: EdgeInsets.all(16),
        // height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 350,
                  width: 150,
                  child: CupertinoPicker.builder(
                    scrollController: _monthController,
                    itemExtent: 40,
                    childCount: months.length,
                    changeReportingBehavior:
                        ChangeReportingBehavior.onScrollEnd,
                    selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                      background: AppColors.primary.withValues(alpha: .2),
                    ),

                    diameterRatio: 1.5,

                    onSelectedItemChanged: (index) {
                      selectedMonth = index + 1;
                    },

                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          months.elementAt(index),
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: 150,
                  child: CupertinoPicker.builder(
                    scrollController: _yearController,
                    itemExtent: 40,
                    childCount: 40,
                    changeReportingBehavior:
                        ChangeReportingBehavior.onScrollEnd,
                    selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                      background: AppColors.primary.withValues(alpha: .2),
                    ),
                    diameterRatio: 1.5,

                    onSelectedItemChanged: (index) {
                      selectedYear = yearsList.elementAt(index);
                    },

                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          (2000 + index).toString(),
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomOutlinedButton(
                  onTap: () {
                    context.pop();
                  },
                  title: "Cancel",
                  width: 120,
                ),
                LoadingButton(
                  onTap: () {
                    final selectedDate = DateTime(selectedYear, selectedMonth);
                    context.pop(selectedDate);
                  },
                  title: "Select",
                  width: 120,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
