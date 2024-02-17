import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../models/base_list_model.dart';
import '../../../../models/episode_model.dart';
import '../../../../models/general_response.dart';
import 'episodes_data_event.dart';
import 'episodes_data_state.dart';

class EpisodesDataBloc extends Bloc<EpisodesDataEvent, EpisodesDataState> {
  void homeStateBusy() => add(EpisodesSendEvent());
  void homeStateLoaded(dynamic data) => add(EpisodesLoadedEvent(data));
  void homeStateError(dynamic err) => add(EpisodesErrorEvent(err));

  EpisodesDataBloc(super.initialState) {
    on<EpisodesDataEvent>(
      (event, emit) {
        switch (event) {
          case EpisodesSendEvent():
            if (state.episodeListModel == null) Utils.showProgressDialog();
            emit(state.copyWith(state: EpisodesState.Busy));
            break;
          case EpisodesErrorEvent():
            if (state.episodeListModel == null) Utils.back();
            if (event.err is GeneralResponse) Utils.showErrorDialog((event.err as GeneralResponse).message ?? "Bir Sorun Oluştu!");
            emit(state.copyWith(state: EpisodesState.Error));
            break;
          case EpisodesLoadedEvent():
            if (state.episodeListModel == null) Utils.back();
            (event.data is BaseListModel<Episode>)
                ? emit(
                    state.copyWith(
                      state: EpisodesState.Loaded,
                      episodeListModel: event.data,
                      page: state.page + 1,
                      hasMoreData: (state.page != (event.data as BaseListModel).info?.pages),
                    ),
                  )
                : emit(state.copyWith(state: EpisodesState.Loaded));
            break;
          default:
        }
      },
    );
  }
}
