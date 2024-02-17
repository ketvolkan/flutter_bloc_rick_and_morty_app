import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../repositories/episode_repository.dart';
import '../bloc/episodes_state_bloc/episodes_data_bloc.dart';

class EpisodesController {
  Future<void> getAllData(BuildContext context) async {
    EpisodesDataBloc dataBloc = context.read<EpisodesDataBloc>();
    errorHandler(
      tryMethod: () async {
        final episodeRepository = EpisodeRepository();
        dataBloc.homeStateBusy();
        final result = await episodeRepository.getEpisodesList(page: dataBloc.state.page);
        result.results = (dataBloc.state.episodeListModel?.results ?? []) + (result.results ?? []);
        dataBloc.homeStateLoaded(result);
      },
      onErr: (e) {
        dataBloc.homeStateError(e);
      },
    );
  }
}
