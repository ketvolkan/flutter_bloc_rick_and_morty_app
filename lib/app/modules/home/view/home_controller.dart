import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../repositories/character_repository.dart';
import '../bloc/home_state_bloc/home_data_bloc.dart';

class HomeController {
  Future<void> getAllData(BuildContext context) async {
    HomeDataBloc dataBloc = context.read<HomeDataBloc>();
    errorHandler(
      tryMethod: () async {
        final charachterRepository = CharacterRepository();
        dataBloc.homeStateBusy();
        final result = await charachterRepository.getCharacterList(page: dataBloc.state.page);
        result.results = (dataBloc.state.charachterListModel?.results ?? []) + (result.results ?? []);
        dataBloc.homeStateLoaded(result);
      },
      onErr: (e) {
        dataBloc.homeStateError(e);
      },
    );
  }
}
