part of '../edit_work_days_screen.dart';

class WorkDayCard extends StatelessWidget {
  const WorkDayCard({
    super.key,
    required this.day,
    required this.schedule,
    this.onDeleteTap,
    this.onEditTap,
  });

  final String day;
  final String schedule;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(day, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Expanded(
            child: Text(
              schedule,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: onEditTap,
            icon: Icon(Icons.delete_outlined, color: AppColors.error),
          ),
          // IconButton(onPressed: onEditTap, icon: Icon(Icons.edit_outlined)),
        ],
      ),
    );
  }
}
