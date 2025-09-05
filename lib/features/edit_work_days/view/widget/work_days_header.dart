part of '../edit_work_days_screen.dart';

class WorkDaysHeader extends StatelessWidget {
  const WorkDaysHeader({super.key, this.onAddTap});

  final void Function()? onAddTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Work Schedule", style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          onPressed: onAddTap,
          icon: Icon(Icons.add),
          color: AppColors.onPrimaryContainer,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.onPrimaryContainer.withValues(
              alpha: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
