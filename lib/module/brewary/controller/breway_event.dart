abstract class BrewaryEvent {
  BrewaryEvent();
}

class GetbrewaryData extends BrewaryEvent {
  final String cityName;
  GetbrewaryData({required this.cityName});
}

class GetOrientData extends BrewaryEvent {
  GetOrientData();
}

class GetDateFilterData extends BrewaryEvent {
  String pageIndex;
  final String fromDate;
  final String toDate;
  GetDateFilterData({
    this.pageIndex = "1",
    required this.fromDate,
    required this.toDate,
  });
}

class GetDate extends BrewaryEvent {
  final String fromDate;
  final String toDate;
  GetDate({required this.fromDate, required this.toDate});
}
