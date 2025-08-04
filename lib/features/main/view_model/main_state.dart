class MainState {
  final int selectedIndex;

  MainState({required this.selectedIndex});

  MainState copyWith({int? selectedIndex}) =>
      MainState(selectedIndex: selectedIndex ?? this.selectedIndex);
}
