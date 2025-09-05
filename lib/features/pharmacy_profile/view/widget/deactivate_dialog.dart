part of "../pharmacy_profile_screen.dart";

class DeactivateDialog extends ConsumerStatefulWidget {
  const DeactivateDialog({super.key});

  @override
  ConsumerState<DeactivateDialog> createState() => _DeactivateDialogState();

  static void builder(BuildContext context) async {
     showDialog(
      context: context,
      builder: (context) {
        return DeactivateDialog();
      },
    );
  }
}

class _DeactivateDialogState extends ConsumerState<DeactivateDialog> {
  String? _selectedReason;
  final TextEditingController _otherController = TextEditingController();

  final List<String> _reasons = [
    "I no longer need the app",
    "I’m switching to another service",
    "I faced technical issues",
    "I’m concerned about data/privacy",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(pharmacyProfileViewModelProvider);

    ref.listen(
      pharmacyProfileViewModelProvider.select(
        (value) => value.deactivateAccount,
      ),
      (previous, next) => next?.when(
        data: (data) {
          context.go(SignupScreen.routeName);
        },
        error:
            (error, stackTrace) =>
                showSnackBarErrorMessage(context, message: error.toString()),
        loading: () {},
      ),
    );

    return AlertDialog(
      title: const Text("Deactivate Account"),
      backgroundColor: AppColors.backgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Before deactivating, please share the main reason."),
          const SizedBox(height: 12),
          RadioGroup<String>(
            groupValue: _selectedReason,
            onChanged: (String? value) {
              setState(() {
                _selectedReason = value;
              });
            },
            child: Column(
              children:
                  _reasons.map((reason) {
                    return RadioListTile(
                      value: reason,
                      title: Text(
                        reason,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
            ),
          ),
          if (_selectedReason == "Other")
            TextField(
              controller: _otherController,
              decoration: const InputDecoration(labelText: "Please specify"),
            ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        LoadingButton(
          onTap: () {
            String reason = _selectedReason ?? "";
            if (reason == "Other") {
              reason = _otherController.text.trim();
            }

            ref
                .read(pharmacyProfileViewModelProvider.notifier)
                .deactivateAccount(deactivationReason: reason);
          },
          isLoading: profileState.deactivateAccount?.isLoading ?? false,
          width: 100.w,
          color: AppColors.error.withValues(alpha: .1),
          title: "Deactivate",
          textStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.error),
        ),
      ],
    );
  }
}
