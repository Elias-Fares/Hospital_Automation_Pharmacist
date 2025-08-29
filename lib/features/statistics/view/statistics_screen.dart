import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/function/date_format.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/cards/loading_card.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';

import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/data/models/monthly_revenu_model.dart';
import 'package:medicare_pharmacy/data/models/selling_model.dart';
import 'package:medicare_pharmacy/features/statistics/view_model/statistics_view_model.dart'
    show statisticsViewModelProvider;
part "widget/revenue_chart.dart";
part 'widget/medicines_sales.dart';
part 'widget/month_year_picker_dialog.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});
  static const routeName = "/statistics_screen";

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  @override
  void initState() {
    super.initState();

    final currentDate = DateTime.now();

    Future.microtask(() {
      // ref.read(statisticsViewModelProvider.notifier).getRevenue(from: "", to: "");
      ref
          .read(statisticsViewModelProvider.notifier)
          .fetchMostLeastSold(date: currentDate);
      ref
          .read(statisticsViewModelProvider.notifier)
          .fetchRevenue(year: currentDate.year);
    });
  }

  @override
  Widget build(BuildContext context) {
    final statsState = ref.watch(statisticsViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Statistics",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            RevenueChart(
              initialYear: statsState.selectedYear,
              response: statsState.revenueResponse,

              onYearTap: (year) {
                ref
                    .read(statisticsViewModelProvider.notifier)
                    .fetchRevenueByYear(year: year);
              },

              fetchRevenueTryAgain: () {
                ref
                    .read(statisticsViewModelProvider.notifier)
                    .retryFetchRevenueByYear();
              },
            ),
            SizedBox(height: 30.h),

            MedicinesSales(
              response: statsState.mostLeastSoldResponse,
              initialDate: statsState.medicineSaleDate,
              onSelectDateTap: () async {
                final selectedDate = await MonthYearPickerDialog.builder(
                  context,
                );
                ref
                    .read(statisticsViewModelProvider.notifier)
                    .handleOnSelectDateTap(dateTime: selectedDate);
              },
              onSalesTryAgainTap: () {
                ref
                    .read(statisticsViewModelProvider.notifier)
                    .fetchMostLeastSold(date: statsState.medicineSaleDate);
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
