part of '../statistics_screen.dart';

class MedicinesSales extends StatelessWidget {
  const MedicinesSales({
    super.key,
    required this.response,
    this.onSalesTryAgainTap,
    this.onSelectDateTap,
    required this.initialDate,
  });

  final AsyncValue<SellingModel>? response;
  final void Function()? onSalesTryAgainTap;
  final void Function()? onSelectDateTap;
  final DateTime initialDate;

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
              CustomInkwell(
                onTap: onSelectDateTap,

                borderSide: BorderSide(color: Colors.grey.shade500),

                borderRadius: BorderRadius.circular(8),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    initialDate.getYearMonth(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),
          response?.when(
                data:
                    (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Most Sold",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
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
                                        "${Constant.baseUrl}/${data.maximumSelling?.medicine?.medImageUrl ?? ""}",
                                    width: 44,
                                    height: 44,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.maximumSelling?.medicine?.name ?? "",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${data.maximumSelling?.numberOfSellingThatItem} Tablets Sold",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
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
                        Text(
                          "Least Sold",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
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
                                        "${Constant.baseUrl}/${data.minimumSelling?.medicine?.medImageUrl ?? ""}",
                                    width: 44,
                                    height: 44,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.minimumSelling?.medicine?.name ?? "",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "${data.minimumSelling?.numberOfSellingThatItem} Tablets Sold",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
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
                error:
                    (error, stackTrace) => CustomErrorWidget(
                      message: error.toString(),
                      height: 200,
                      onTryAgainTap: onSalesTryAgainTap,
                    ),
                loading:
                    () => LoadingCard(
                      borderRadius: BorderRadius.circular(12),
                      width: 1.sw,
                      height: 200,
                    ),
              ) ??
              SizedBox.shrink(),
        ],
      ),
    );
  }
}
