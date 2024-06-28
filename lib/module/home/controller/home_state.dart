class HomeState {
  final bool balanceTab;
  final bool walletTab;
  final int selectedIndex;
  HomeState({
    required this.balanceTab,
    required this.walletTab,
    required this.selectedIndex,
  });

  factory HomeState.initial() =>
      HomeState(balanceTab: true, walletTab: false, selectedIndex: 0);

  HomeState copyWith({bool? balanceTab, bool? walletTab, int? selectedIndex}) {
    return HomeState(
      balanceTab: balanceTab ?? this.balanceTab,
      walletTab: walletTab ?? this.walletTab,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
