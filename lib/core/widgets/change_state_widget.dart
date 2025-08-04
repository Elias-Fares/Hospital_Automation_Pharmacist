import 'package:flutter/material.dart';
import '../style/app_colors.dart';

class ChangeStateWidget extends StatelessWidget {
  const ChangeStateWidget(
      {super.key,
      required this.successWidget,
      this.failureWidget,
      this.loadingWidget,
      required this.isLoading,
      required this.isError,
      this.loadingWidgetHieght,
      this.errorMessage});
  final Widget successWidget;
  final Widget? failureWidget;
  final Widget? loadingWidget;
  final bool isLoading;
  final bool isError;
  final double? loadingWidgetHieght;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: loadingWidgetHieght,
        child: Center(
          child: loadingWidget ??
              const CircularProgressIndicator(
                color: AppColors.primary,
              ),
        ),
      );
    }
    if (isError) {
      return Center(child: failureWidget ?? Text(errorMessage ?? ""));
    }
    return successWidget;
  }
}
