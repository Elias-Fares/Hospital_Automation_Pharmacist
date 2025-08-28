part of '../statistics_screen.dart';

class RevenueChart extends StatelessWidget {
  final List<double> revenueData = const [
    6.2,
    9.6,
    9.0,
    5.3,
    6.8,
    2.7,
    5.6,
    8.4,
    11.0,
    9.4,
    7.8,
    8.1,
  ];

  const RevenueChart({super.key});

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
                    "Revenue is in millions.",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ],
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
          SizedBox(height: 20),
          SizedBox(
            width: 1.sw,
            height: 1.sh * 0.4,
            child: BarChart(
              BarChartData(
                maxY: 12,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 1,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine:
                      (value) =>
                          FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
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
                      reservedSize: 30,
                      interval: 2,
                      getTitlesWidget: (value, meta) {
                        if (value % 2 == 0 && value > 0) {
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
                        const months = [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec',
                        ];
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
                    revenueData.asMap().entries.map((entry) {
                      int index = entry.key;
                      double value = entry.value;
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
          ),

          const SizedBox(height: 10),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomInkwell(
                color: AppColors.onPrimaryContainerBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "Monthly",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.onPrimaryContainerBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CustomInkwell(
                color: AppColors.onPrimaryContainerBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "Yearly",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.onPrimaryContainerBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


