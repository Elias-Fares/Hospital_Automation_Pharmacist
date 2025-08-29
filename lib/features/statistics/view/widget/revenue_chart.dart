part of '../statistics_screen.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({
    super.key,
    this.onYearTap,
    required this.initialYear,
    this.response,
    this.fetchRevenueTryAgain,
  });

  final void Function(int?)? onYearTap;
  final void Function()? fetchRevenueTryAgain;
  final int initialYear;
  final AsyncValue<List<MonthlyRevenuModel>>? response;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 1.sw,
      // height: 1.sh * 0.5,
      decoration: containerCardDecoration(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Bar Chart
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
                  Icons.monetization_on_outlined,
                  color: AppColors.onSurfaceVariant,
                  size: 18,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Revenue Statistics",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "Revenue is in S.P.",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              DropdownButton<int>(
                value: initialYear,
                borderRadius: BorderRadius.circular(12),
                
                items: List.generate(5, (index) {
                  final year = 2024 + index;

                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(
                      year.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }),
                onChanged: onYearTap,
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 1.sw,
            height: 1.sh * 0.4,
            child: response?.when(
              data:
                  (data) => BarChart(
                    BarChartData(
                      maxY: 12,
                      gridData: FlGridData(
                        show: true,
                        horizontalInterval: 1,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine:
                            (value) => FlLine(
                              color: Colors.grey.shade300,
                              strokeWidth: 0.5,
                            ),
                        drawHorizontalLine: true,
                      ),
                      borderData: FlBorderData(
                        border: Border(
                          left: BorderSide(
                            color: AppColors.onSurfaceContainer,
                            width: .5,
                          ),
                          bottom: BorderSide(
                            color: AppColors.onSurfaceContainer,
                            width: .5,
                          ),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 20,

                            getTitlesWidget: (value, meta) {
                              if (value > 0) {
                                return Text(
                                  value.toInt().toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final months =
                                  data
                                      .map(
                                        (e) => e.month?.substring(0, 3) ?? "",
                                      )
                                      .toList();
                              if (value.toInt() >= 0 &&
                                  value.toInt() < months.length) {
                                return Text(
                                  months[value.toInt()],
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(
                                    color: AppColors.onSecondaryContainer,
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      barGroups:
                          data.asMap().entries.map((entry) {
                            int index = entry.key;
                            double value =
                                double.tryParse(
                                  entry.value.monthlyRevenu?.monthlyRevenue
                                          ?.toString() ??
                                      "0.0",
                                ) ??
                                0.0;

                            if (value > 0.0) {
                              value = value / 1000000;
                            }

                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: value,
                                  color: AppColors.chartColor,
                                  width: 14,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ],
                            );
                          }).toList(),
                    ),
                  ),
              error:
                  (error, stackTrace) => CustomErrorWidget(
                    message: error.toString(),
                    onTryAgainTap: fetchRevenueTryAgain,
                  ),
              loading:
                  () => LoadingCard(borderRadius: BorderRadius.circular(12)),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
