part of '../dispense_screen.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchTextEditingController,
    this.onEditingComplete,
  });

  final TextEditingController searchTextEditingController;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.hintTextColor.withValues(alpha: .18),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Enter Prescription code",
          suffixIcon: Icon(Icons.search_rounded, color: AppColors.primary),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        controller: searchTextEditingController,
        onEditingComplete: onEditingComplete,
      ),
    );
  }
}
