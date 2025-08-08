part of '../batches_screen.dart';

class BatchRow extends StatelessWidget {
  const BatchRow({
    super.key,
    required this.remainingQuantity,
    required this.expirationDate,
    required this.state,
  });
  final String remainingQuantity;
  final String expirationDate;
  final String state; // expired, warning, safe

  Color _colorSelector() {
    if (state == "expired") {
      return AppColors.error;
    } else if (state == "warning") {
      return AppColors.warning;
    } else {
      return AppColors.white;
    }
  }

  Color _backgroundColorSelector() {
    if (state == "expired") {
      return AppColors.error.withValues(alpha: 0.05);
    } else if (state == "warning") {
      return AppColors.warning.withValues(alpha: 0.05);
    } else {
      return AppColors.white;
    }
  }

  Widget _iconSelector() {
    if (state == "expired") {
      return GeneralImageAssets(
        path: Res.errorIcon,
        color: AppColors.error,
        width: 18,
        height: 18,
      );
    } else if (state == "warning") {
      return GeneralImageAssets(
        path: Res.notificationIcon,
        color: AppColors.warning,
        width: 18,
        height: 18,
      );
    } else {
      return GeneralImageAssets(
        path: Res.verified,
        color: AppColors.greenText,
        width: 18,
        height: 18,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      decoration: containerCardDecoration().copyWith(
        color: _backgroundColorSelector(),
        border: Border.all(color: _colorSelector()),
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              remainingQuantity,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Text(
              expirationDate,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          // Flexible(child: _iconSelector()),
          _iconSelector(),
        ],
      ),
    );
  }
}
