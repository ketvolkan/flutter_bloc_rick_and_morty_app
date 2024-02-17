import 'package:equatable/equatable.dart';

import '../../../../models/base_list_model.dart';
import '../../../../models/character_model.dart';

enum HomeState { Initial, Loaded, Busy, Error }

// ignore: must_be_immutable
class HomeDataState extends Equatable {
  HomeState state = HomeState.Initial;
  BaseListModel<Character>? charachterListModel;
  int page = 1;
  bool hasMoreData = true;
  HomeDataState({this.state = HomeState.Initial, this.charachterListModel, this.hasMoreData = true, this.page = 1});

  @override
  List<Object?> get props => [state, charachterListModel, page, hasMoreData];

  HomeDataState copyWith({HomeState? state, BaseListModel<Character>? charachterListModel, int? page, bool? hasMoreData}) => HomeDataState(
        state: state ?? this.state,
        charachterListModel: charachterListModel ?? this.charachterListModel,
        page: page ?? this.page,
        hasMoreData: hasMoreData ?? this.hasMoreData,
      );
}
