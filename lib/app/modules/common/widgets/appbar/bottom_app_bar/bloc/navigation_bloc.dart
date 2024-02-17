import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_event.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/modules/common/widgets/appbar/bottom_app_bar/bloc/navigation_state.dart';

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
