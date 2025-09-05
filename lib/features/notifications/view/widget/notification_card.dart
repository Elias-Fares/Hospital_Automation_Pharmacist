part of '../notifications_screen.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.type,
    required this.body,
    required this.time,
  });

  final String type;
  final String body;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NotificationTypeWidget(
                type: type,
                color: AppColors.onPrimaryContainerBlue,
              ),
              Text(
                time,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.hintTextColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(body),
        ],
      ),
    );
  }
}
