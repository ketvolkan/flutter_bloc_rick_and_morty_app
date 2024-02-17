import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../models/base_list_model.dart';
import '../../../../models/general_response.dart';
import '../../../../models/location_model.dart';
import 'locations_data_event.dart';
import 'locations_data_state.dart';

class LocationsDataBloc extends Bloc<LocationsDataEvent, LocationsDataState> {
  void homeStateBusy() => add(LocationsSendEvent());
  void homeStateLoaded(dynamic data) => add(LocationsLoadedEvent(data));
  void homeStateError(dynamic err) => add(LocationsErrorEvent(err));

  LocationsDataBloc(super.initialState) {
    on<LocationsDataEvent>(
      (event, emit) {
        switch (event) {
          case LocationsSendEvent():
            if (state.locationListModel == null) Utils.showProgressDialog();
            emit(state.copyWith(state: LocationsState.Busy));
            break;
          case LocationsErrorEvent():
            if (state.locationListModel == null) Utils.back();
            if (event.err is GeneralResponse) Utils.showErrorDialog((event.err as GeneralResponse).message ?? "Bir Sorun Oluştu!");
            emit(state.copyWith(state: LocationsState.Error));
            break;
          case LocationsLoadedEvent():
            if (state.locationListModel == null) Utils.back();
            (event.data is BaseListModel<Location>)
                ? emit(
                    state.copyWith(
                      state: LocationsState.Loaded,
                      locationListModel: event.data,
                      page: state.page + 1,
                      hasMoreData: (state.page != (event.data as BaseListModel).info?.pages),
                    ),
                  )
                : emit(state.copyWith(state: LocationsState.Loaded));
            break;
          default:
        }
      },
    );
  }
}
