import 'package:riverpod_annotation/riverpod_annotation.dart';

class MainState {
  final int selectedIndex;
  final AsyncValue? notificationTrigger;

  MainState({required this.selectedIndex, this.notificationTrigger});

  MainState copyWith({int? selectedIndex, AsyncValue? notificationTrigger}) =>
      MainState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        notificationTrigger: notificationTrigger ?? this.notificationTrigger,
      );
}
