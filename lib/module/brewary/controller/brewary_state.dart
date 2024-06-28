import 'package:stack_overflow/module/brewary/model/brewary_model.dart';
import 'package:stack_overflow/module/brewary/model/orient_model.dart';
import 'package:stack_overflow/module/brewary/model/program_account_detail.dart';

class BrewaryState {
  final bool filterDataLoading;
  final String selectedFromDate;
  final String selectedToDate;
  final dynamic error;
  final bool isFetching;
  final String countryName;
  final OrientDTO orientDTO;
  final bool loadingMore;
  final List<BrewaryDTO> brewaryDTO;
  int pageIndex;
  final List<ProgramAccountStatementDetails> programAccountStatementDetails;

  BrewaryState({
    required this.filterDataLoading,
    required this.selectedFromDate,
    required this.selectedToDate,
    required this.error,
    required this.orientDTO,
    required this.loadingMore,
    required this.brewaryDTO,
    required this.isFetching,
    required this.countryName,
    required this.pageIndex,
    required this.programAccountStatementDetails,
  });

  factory BrewaryState.initial() => BrewaryState(
        filterDataLoading: false,
        selectedFromDate: "",
        selectedToDate: "",
        error: {},
        loadingMore: false,
        orientDTO: OrientDTO.initial(),
        brewaryDTO: [],
        isFetching: false,
        countryName: "India",
        pageIndex: 1,
        programAccountStatementDetails: [],
      );

  BrewaryState copyWith({
    bool? filterDataLoading,
    String? selectedFromDate,
    String? selectedToDate,
    dynamic error,
    bool? loadingMore,
    OrientDTO? orientDTO,
    List<BrewaryDTO>? brewaryDTO,
    bool? isFetching,
    String? countryName,
    int? pageIndex,
    List<ProgramAccountStatementDetails>? programAccountStatementDetails,
  }) {
    return BrewaryState(
      filterDataLoading: filterDataLoading ?? this.filterDataLoading,
      selectedFromDate: selectedFromDate ?? this.selectedFromDate,
      selectedToDate: selectedToDate ?? this.selectedToDate,
      error: error ?? this.error,
      pageIndex: pageIndex ?? this.pageIndex,
      loadingMore: loadingMore ?? this.loadingMore,
      orientDTO: orientDTO ?? this.orientDTO,
      brewaryDTO: brewaryDTO ?? this.brewaryDTO,
      isFetching: isFetching ?? this.isFetching,
      countryName: countryName ?? this.countryName,
      programAccountStatementDetails:
          programAccountStatementDetails ?? this.programAccountStatementDetails,
    );
  }

  // (
  //   bool? filterDataLoading,
  //   String? selectedFromDate,
  //   String? selectedToDate,
  //   dynamic error,
  //   int? pageIndex,
  //   bool? loadingMore,
  //   OrientDTO? orientDTO,
  //   List<BrewaryDTO>? brewaryDTO,
  //   bool? isFetching,
  //   String? countryName,
  //   List<ProgramAccountStatementDetails>? programAccountStatementDetails,
  // ) copyWith({required bool filterDataLoading}) {
  //   return (
  //     filterDataLoading,
  //     selectedFromDate,
  //     selectedToDate,
  //     error,
  //     pageIndex,
  //     loadingMore,
  //     orientDTO,
  //     brewaryDTO,
  //     isFetching,
  //     countryName,
  //     programAccountStatementDetails
  //   );
  // }
}
