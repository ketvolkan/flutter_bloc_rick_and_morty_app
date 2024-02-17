import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../models/base_list_model.dart';
import '../../../../models/character_model.dart';
import '../../../../models/general_response.dart';
import 'home_data_event.dart';
import 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  void homeStateBusy() => add(HomeSendEvent());
  void homeStateLoaded(dynamic data) => add(HomeLoadedEvent(data));
  void homeStateError(dynamic err) => add(HomeErrorEvent(err));

  HomeDataBloc(super.initialState) {
    on<HomeDataEvent>(
      (event, emit) {
        switch (event) {
          case HomeSendEvent():
            if (state.charachterListModel == null) Utils.showProgressDialog();
            emit(state.copyWith(state: HomeState.Busy));
            break;
          case HomeErrorEvent():
            if (state.charachterListModel == null) Utils.back();
            if (event.err is GeneralResponse) Utils.showErrorDialog((event.err as GeneralResponse).message ?? "Bir Sorun Oluştu!");
            emit(state.copyWith(state: HomeState.Error));
            break;
          case HomeLoadedEvent():
            if (state.charachterListModel == null) Utils.back();
            (event.data is BaseListModel<Character>)
                ? emit(
                    state.copyWith(
                      state: HomeState.Loaded,
                      charachterListModel: event.data,
                      page: state.page + 1,
                      hasMoreData: (state.page != (event.data as BaseListModel).info?.pages),
                    ),
                  )
                : emit(state.copyWith(state: HomeState.Loaded));
            break;
          default:
        }
      },
    );
  }
}
