import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  void characterRouteTap() => add(CharacterEvent());
  void episodesRouteTap() => add(EpisodesEvent());
  void locationRouteTap() => add(LocationEvent());
  void settignsRouteTap() => add(SettingsEvent());

  NavigationBloc(super.initialState) {
    on<NavigationEvent>((event, emit) {
      emit(state.copyWith(selectedTab: event.route));
    });
  }
}
