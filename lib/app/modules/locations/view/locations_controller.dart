import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../repositories/location_repository.dart';
import '../bloc/locations_state_bloc/locations_data_bloc.dart';

class LocationsController {
  Future<void> getAllData(BuildContext context) async {
    LocationsDataBloc dataBloc = context.read<LocationsDataBloc>();
    errorHandler(
      tryMethod: () async {
        final locationRepository = LocationRepository();
        dataBloc.homeStateBusy();
        final result = await locationRepository.getLocationsList(page: dataBloc.state.page);
        result.results = (dataBloc.state.locationListModel?.results ?? []) + (result.results ?? []);
        dataBloc.homeStateLoaded(result);
      },
      onErr: (e) {
        dataBloc.homeStateError(e);
      },
    );
  }
}
