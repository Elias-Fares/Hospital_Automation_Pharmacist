import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/data/models/selling_model.dart';
import 'package:medicare_pharmacy/features/statistics/view_model/statistics_view_model.dart'
    show statisticsViewModelProvider;
part "widget/revenue_chart.dart";

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

    Future.microtask(() {
      // ref.read(statisticsViewModelProvider.notifier).getRevenue(from: "", to: "");
      ref.read(statisticsViewModelProvider.notifier).getMostLeastSold();
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
            const RevenueChart(),
            SizedBox(height: 30.h),
            statsState.mostLeastSoldResponse?.when(
                  data: (data) => MedicinesSales(sellingModel: data),
                  error:
                      (error, stackTrace) => CustomErrorWidget(
                        message: error.toString(),
                        onTryAgainTap: () {
                          ref
                              .read(statisticsViewModelProvider.notifier)
                              .getMostLeastSold();
                        },
                      ),
                  loading: () => CustomLoadingWidget(),
                ) ??
                SizedBox.fromSize(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class MedicinesSales extends StatelessWidget {
  const MedicinesSales({super.key, required this.sellingModel});

  final SellingModel sellingModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.hintTextColor),
                ),
                child: Icon(
                  Icons.medication_outlined,
                  color: AppColors.onSurfaceVariant,
                  size: 18,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Medicines Sales",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "2025",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),
          Text("Most Sold", style: Theme.of(context).textTheme.labelMedium),
          CustomInkwell(
            onTap: () {},
            color: AppColors.white,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipOval(
                    child: GeneralNetworkImage(
                      url:
                          "${Constant.baseUrl}/${sellingModel.maximumSelling?.medicine?.medImageUrl ?? ""}",
                      width: 44,
                      height: 44,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sellingModel.maximumSelling?.medicine?.name ?? "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${sellingModel.maximumSelling?.numberOfSellingThatItem} Tablets Sold",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.hintTextColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text("Least Sold", style: Theme.of(context).textTheme.labelMedium),
          CustomInkwell(
            onTap: () {},
            color: AppColors.white,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipOval(
                    child: GeneralNetworkImage(
                      url:
                          "${Constant.baseUrl}/${sellingModel.minimumSelling?.medicine?.medImageUrl ?? ""}",
                      width: 44,
                      height: 44,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sellingModel.minimumSelling?.medicine?.name ?? "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${sellingModel.minimumSelling?.numberOfSellingThatItem} Tablets Sold",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.hintTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
