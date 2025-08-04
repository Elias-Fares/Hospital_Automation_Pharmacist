part of '../batches_screen.dart';
class BatchesHeader extends StatelessWidget {
  const BatchesHeader({super.key, this.onAddTap});

  final void Function()? onAddTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Batches", style: Theme.of(context).textTheme.titleSmall),
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
