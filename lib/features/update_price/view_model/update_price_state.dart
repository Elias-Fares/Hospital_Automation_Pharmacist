class UpdatePriceState {
  final List<String> selectedMedsIds;

  UpdatePriceState({required this.selectedMedsIds});

  UpdatePriceState copyWith({List<String>? selectedMedsIds}) {
    return UpdatePriceState(
      selectedMedsIds: selectedMedsIds ?? this.selectedMedsIds,
    );
  }
}
