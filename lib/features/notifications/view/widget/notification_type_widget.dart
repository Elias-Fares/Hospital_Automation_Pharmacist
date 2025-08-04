part of '../notifications_screen.dart';

class NotificationTypeWidget extends StatelessWidget {
  const NotificationTypeWidget(
      {super.key, required this.type, required this.color});

  final String type;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        type,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(fontWeight: FontWeight.w700, color: color),
      ),
    );
  }
}
