import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:convert';

// Top-level background handler must be outside any class or method.
// It must also be a static function.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // It's crucial to re-initialize everything needed for the isolate.
  // This includes Firebase, which is why we call NotificationService.init()
  // in the background handler itself.
  await NotificationService.setupChannelsAndPlugin();
  NotificationService.showNotification(message);
}

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

    // Setup channels and plugin. This must be done here for the main app isolate.
    await setupChannelsAndPlugin();

    // Register the top-level background handler.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listen for foreground messages and show a local notification.
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    // Handle taps when app is in the background.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotificationTap(message.data);
    });

    // Handle app launch from a terminated state via notification tap.
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      // Small delay to allow the UI to build before navigating.
      await Future.delayed(const Duration(milliseconds: 500));
      _handleNotificationTap(initialMessage.data);
    }

    isInitialized = true;
  }

  /// Setup channels and plugin. This is called from both the main isolate
  /// and the background isolate.
  static Future<void> setupChannelsAndPlugin() async {
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

    // Create channels on Android.
    final androidPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(reminderChannel);
      await androidPlugin.createNotificationChannel(warningChannel);
    }

    // iOS foreground presentation options.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Initialize the plugin with platform-specific settings.
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
            // Decode the payload from a JSON string back to a Map.
            final data = json.decode(details.payload!) as Map<String, dynamic>;
            _handleNotificationTap(data);
          } catch (_) {
            debugPrint('Failed to decode notification payload');
          }
        }
      },
    );
  }

  /// Show a local notification using the provided RemoteMessage.
  static Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      // Determine the channel based on message data.
      final channel =
          message.data['type'] == 'warning' ? warningChannel : reminderChannel;

      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
        // Store the message data as a JSON string in the payload.
        payload: json.encode(message.data),
      );
    }
  }

  /// Handle notification tap by navigating or performing an action.
  static void _handleNotificationTap(Map<String, dynamic> data) {
    if (data.isEmpty) return;

    // TODO: Implement navigation logic here.
    // Use a Navigator key or a routing service to navigate to a specific screen
    // based on the content of the `data` map.
    debugPrint('Notification tapped with data: $data');
  }

  /// Reset all notifications and badge count.
  static Future<void> resetNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  /// Get the Firebase Cloud Messaging (FCM) token.
  static Future<String?> getFCMToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) debugPrint('FCM token: $token');
    return token;
  }
}
