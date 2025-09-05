import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/function/date_format.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/features/notifications/view_model/notifications_view_model.dart';
import '../../../core/style/app_colors.dart';

part 'widget/notification_card.dart';
part 'widget/notification_type_widget.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  static const routeName = "/notifications_screen";
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(notificationsViewModelProvider.notifier).fetchNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationsState = ref.watch(notificationsViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(),
      body:
          notificationsState.notificationsResponse?.when(
            data: (data) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final notification = data.elementAt(index);
                    return NotificationCard(
                      type: notification.type ?? "",
                      body: notification.message ?? "",
                      time: notification.createdAt?.toReadableDateTime() ?? "",
                      // time: notification.createdAt.toString(),
                    );
                  },
                ),
              );
            },
            error:
                (error, stackTrace) =>
                    CustomErrorWidget(message: error.toString()),
            loading: () => CustomLoadingWidget(),
          ) ??
          SizedBox.shrink(),
    );
  }
}
