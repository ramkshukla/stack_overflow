abstract class HomeEvent {
  HomeEvent();
}

class ActiveTab extends HomeEvent {
  final bool value;
  ActiveTab({required this.value});
}

class SelecteIndex extends HomeEvent {
  final int index;
  SelecteIndex({required this.index});
}
