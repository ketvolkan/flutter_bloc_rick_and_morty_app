import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigator_state.dart' as bloc;

class NavigatorBloc extends Bloc<dynamic, bloc.NavigatorState> {
  void changeNavigatorState(bool showDashboard) => add(showDashboard);
  void changeContext(BuildContext context) => add(context);

  NavigatorBloc(super.initialState) {
    on<bool>((event, emit) => emit(state.copyWith(showDashboard: event)));
    on<BuildContext>((event, emit) => emit(state.copyWith(context: event)));
  }
}
