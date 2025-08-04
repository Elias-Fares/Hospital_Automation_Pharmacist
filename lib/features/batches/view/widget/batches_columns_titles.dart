part of '../batches_screen.dart';
class BatchesColumnsTitles extends StatelessWidget {
  const BatchesColumnsTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      decoration: containerCardDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Remaining quantity",
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              "Expiration date",
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}