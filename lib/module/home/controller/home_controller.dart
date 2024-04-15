import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_overflow/module/home/controller/home_event.dart';
import 'package:stack_overflow/module/home/controller/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<ActiveTab>(
      (event, emit) {
        emit(state.copyWith(
          balanceTab: event.value,
          walletTab: !event.value,
        ));
      },
    );

    on<SelecteIndex>(
      (event, emit) {
        emit(state.copyWith(selectedIndex: event.index));
      },
    );
  }
}
