import 'package:equatable/equatable.dart';

import '../../../../models/base_list_model.dart';
import '../../../../models/location_model.dart';

enum LocationsState { Initial, Loaded, Busy, Error }

// ignore: must_be_immutable
class LocationsDataState extends Equatable {
  LocationsState state = LocationsState.Initial;
  BaseListModel<Location>? locationListModel;
  int page = 1;
  bool hasMoreData = true;
  LocationsDataState({this.state = LocationsState.Initial, this.locationListModel, this.hasMoreData = true, this.page = 1});

  @override
  List<Object?> get props => [state, locationListModel, page, hasMoreData];

  LocationsDataState copyWith({LocationsState? state, BaseListModel<Location>? locationListModel, int? page, bool? hasMoreData}) =>
      LocationsDataState(
        state: state ?? this.state,
        locationListModel: locationListModel ?? this.locationListModel,
        page: page ?? this.page,
        hasMoreData: hasMoreData ?? this.hasMoreData,
      );
}
