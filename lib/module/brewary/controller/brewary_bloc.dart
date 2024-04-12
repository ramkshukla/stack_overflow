import 'package:bloc/bloc.dart';
import 'package:stack_overflow/_util/extensions.dart';
import 'package:stack_overflow/module/brewary/controller/brewary_state.dart';
import 'package:stack_overflow/module/brewary/controller/breway_event.dart';
import 'package:stack_overflow/module/brewary/repo/brewary_repo.dart';

class BrewaryBloc extends Bloc<BrewaryEvent, BrewaryState> {
  BrewaryBloc() : super(BrewaryState.initial()) {
    on<GetbrewaryData>(
      (event, emit) async {
        emit(state.copyWith(isFetching: true));
        final result = await BrewaryRepoImpl().getBrewaryData(event.cityName);
        result.fold(
            (l) => emit(state.copyWith(isFetching: false)),
            (r) => emit(
                  state.copyWith(
                    brewaryDTO: r,
                    isFetching: false,
                    countryName: event.cityName,
                  ),
                ));
      },
    );

    on<GetOrientData>(
      (event, emit) async {
        if (state.pageIndex > 1) {
          emit(state.copyWith(loadingMore: true));

          final result = await BrewaryRepoImpl().getOrientData(
            pageIndex: (state.pageIndex++).toString(),
          );

          result.fold(
            (l) => emit(state.copyWith(loadingMore: false)),
            (r) => emit(
              state.copyWith(
                loadingMore: false,
                programAccountStatementDetails:
                    state.orientDTO.response.programAccountStatementDetails
                      ..addAll(r.response.programAccountStatementDetails),
              ),
            ),
          );
        } else {
          emit(state.copyWith(isFetching: true));
          final result = await BrewaryRepoImpl().getOrientData(
            pageIndex: state.pageIndex.toString(),
          );
          result.fold(
            (l) => emit(state.copyWith(isFetching: false)),
            (r) => emit(
              state.copyWith(
                isFetching: false,
                programAccountStatementDetails:
                    r.response.programAccountStatementDetails,
              ),
            ),
          );
        }
      },
    );

    on<GetDateFilterData>(
      (event, emit) async {
        "Get Date Filter Data: called ${event.fromDate}".logIt;
        emit(state.copyWith(filterDataLoading: true));
        final result = await BrewaryRepoImpl().getOrientData(
          pageIndex: (state.pageIndex++).toString(),
          fromDate: event.fromDate,
          toDate: event.toDate,
        );

        result.fold(
          (l) => emit(state.copyWith(filterDataLoading: false)),
          (r) => emit(
            state.copyWith(
              filterDataLoading: false,
              programAccountStatementDetails:
                  state.orientDTO.response.programAccountStatementDetails
                    ..addAll(r.response.programAccountStatementDetails),
            ),
          ),
        );
      },
    );

    on<GetDate>(
      (event, emit) {
        emit(state.copyWith(
            selectedFromDate: event.fromDate, selectedToDate: event.toDate));

        // GetDateFilterData(
        //     fromDate: state.selectedFromDate, toDate: state.selectedToDate);
      },
    );
  }
}
