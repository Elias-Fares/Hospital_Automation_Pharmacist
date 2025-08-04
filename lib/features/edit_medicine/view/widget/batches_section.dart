part of'../edit_medicine_screen.dart';
class BatchesSection extends StatelessWidget {
  const BatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Batches",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.hintTextColor),
              ),

              Text("18 total", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          CustomTextButton(text: "See Details", onTap: () {}),
        ],
      ),
    );
  }
}

