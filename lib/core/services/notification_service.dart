import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:convert';

class NotificationService {
  // Channels (expandable for multiple types)
  static late AndroidNotificationChannel reminderChannel;
  static late AndroidNotificationChannel warningChannel;

  // Plugin instance
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static bool isInitialized = false;

  /// Initialize service
  static Future<void> init() async {
    if (isInitialized) return;

    // Request notification permissions (Android 13+)
    await Permission.notification.request();

    // Setup channels & plugin
    await setupChannelsAndPlugin();

    // Register background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    // Handle taps when app is in background or terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotificationTap(message.data);
    });

    // Handle app launch from terminated state
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      _handleNotificationTap(initialMessage.data);
    }

    isInitialized = true;
  }

  /// Background handler
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await setupChannelsAndPlugin();
    showNotification(message);
  }

  /// Setup channels and plugin
  static Future<void> setupChannelsAndPlugin() async {
    if (isInitialized) {
      return;
    }
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Reminder channel
    reminderChannel = const AndroidNotificationChannel(
      'reminder_channel',
      'Reminders',
      description: 'Reminder notifications',
      importance: Importance.high,
    );

    // Warning channel (example)
    warningChannel = const AndroidNotificationChannel(
      'warning_channel',
      'Warnings',
      description: 'Warning notifications',
      importance: Importance.max,
    );

    // Create channels on Android
    final androidPlugin =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    await androidPlugin?.createNotificationChannel(reminderChannel);
    await androidPlugin?.createNotificationChannel(warningChannel);

    // iOS foreground presentation
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Initialize plugin
    const androidSettings = AndroidInitializationSettings('launch_background');
    const iOSSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          try {
            final data = json.decode(details.payload!);
            _handleNotificationTap(data);
          } catch (_) {}
        }
      },
    );

    isInitialized = false;
  }

  /// Show notification
  static Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      // Decide channel based on some data (default to reminderChannel)
      final channelId =
          message.data['type'] == 'warning' ? warningChannel : reminderChannel;
      final channelName = channelId.name;
      final channelDescription = channelId.description;

      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channelId.id,
            channelName,
            channelDescription: channelDescription,
            icon: 'launch_background',
          ),
        ),
        payload: json.encode(message.data), // store data for tap handling
      );
    }
  }

  /// Handle notification tap
  static void _handleNotificationTap(Map<String, dynamic> data) {
    if (data.isEmpty) return;

    // Example: handle orderId in notification payload
    final orderId = data['orderId']?.toString() ?? '';
    debugPrint('Notification tapped, orderId: $orderId');

    // TODO: navigate or store data using your preferred state management
  }

  /// Reset notifications and badge
  static Future<void> resetNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  /// Get FCM token
  static Future<String?> getFCMToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) debugPrint('FCM token: $token');
    return token;
  }
}


// class NotificationService {
//   static late AndroidNotificationChannel channel;
//   static bool isFlutterLocalNotificationsInitialized = false;

//   static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   static Future<void> init() async {
//      await Permission.notification.request();
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await setupFlutterNotifications();

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showFlutterNotification(message);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       debugPrint('Notification tapped: ${message.data}');
    
//     });
//   }

//   @pragma('vm:entry-point')
//   static Future<void> _firebaseMessagingBackgroundHandler(
//     RemoteMessage message,
//   ) async {
//     await setupFlutterNotifications();
//     showFlutterNotification(message);
//   }

//   static Future<void> setupFlutterNotifications() async {
//     if (isFlutterLocalNotificationsInitialized) {
//       return;
//     }
//     channel = const AndroidNotificationChannel(
//       'reminder_channel', // id
//       'Reminder', // title
//       description:
//           'This channel is used for reminder notifications.', // description
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin
//         >()
//         ?.createNotificationChannel(channel);

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//     isFlutterLocalNotificationsInitialized = true;
//   }

//   static void showFlutterNotification(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null && android != null && !kIsWeb) {
//       flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//             icon: 'launch_background',
//           ),
//         ),
//       );
//     }
//   }
// }
