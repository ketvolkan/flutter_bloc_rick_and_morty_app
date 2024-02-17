import 'package:equatable/equatable.dart';

import '../../../../models/base_list_model.dart';
import '../../../../models/episode_model.dart';

enum EpisodesState { Initial, Loaded, Busy, Error }

// ignore: must_be_immutable
class EpisodesDataState extends Equatable {
  EpisodesState state = EpisodesState.Initial;
  BaseListModel<Episode>? episodeListModel;
  int page = 1;
  bool hasMoreData = true;
  EpisodesDataState({this.state = EpisodesState.Initial, this.episodeListModel, this.hasMoreData = true, this.page = 1});

  @override
  List<Object?> get props => [state, episodeListModel, page, hasMoreData];

  EpisodesDataState copyWith({EpisodesState? state, BaseListModel<Episode>? episodeListModel, int? page, bool? hasMoreData}) => EpisodesDataState(
        state: state ?? this.state,
        episodeListModel: episodeListModel ?? this.episodeListModel,
        page: page ?? this.page,
        hasMoreData: hasMoreData ?? this.hasMoreData,
      );
}
