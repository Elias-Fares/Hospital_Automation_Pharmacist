import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/appbars/main_app_bar.dart';
import '../../../core/style/app_colors.dart';

part 'widget/notification_card.dart';
part 'widget/notification_type_widget.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = "/notifications_screen";
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const NotificationCard(
              type: "Upcoming Vaccine",
              body:
                  "You missed an appointment under the name “Ali Ahmad” with “Dr. Ali Ahmad” at 11:30 AM on February 12th. Please be aware that missing appointments may result in restrictions on your app features.",
              time: "12:02 AM",
            );
          },
        ),
      ),
    );
  }
}
