part of '../medicines_screen.dart';

class SearchForMedicineTextField extends StatelessWidget {
  const SearchForMedicineTextField({
    super.key,
    required this.searchTextEditingController,
    this.onChanged,
  });

  final TextEditingController searchTextEditingController;
  final Function(String)? onChanged;

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
          hintText: "Enter medicine name here",
          suffixIcon: Icon(Icons.search_rounded, color: AppColors.primary),
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        controller: searchTextEditingController,
        onChanged: onChanged,
      ),
    );
  }
}
