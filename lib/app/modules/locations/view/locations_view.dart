import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../models/base_list_model.dart';
import '../../../models/location_model.dart';
import '../../common/widgets/appbar/custom_app_bar.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/dialogs/custom_progress_dialog.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../bloc/locations_state_bloc/locations_data_bloc.dart';
import '../bloc/locations_state_bloc/locations_data_state.dart';
import '../widgets/locations_card.dart';
import 'locations_controller.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  LocationsController locationsController = LocationsController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    locationsController.getAllData(context);
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge && _scrollController.position.pixels != 0) {
          if (context.read<LocationsDataBloc>().state.hasMoreData) locationsController.getAllData(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BaseListModel<Location>? locationList = context.watch<LocationsDataBloc>().state.locationListModel;
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: gridViewBlocBuilder(context, locationList),
    );
  }

  BlocBuilder<LocationsDataBloc, LocationsDataState> gridViewBlocBuilder(BuildContext context, BaseListModel<Location>? locationList) {
    return BlocBuilder<LocationsDataBloc, LocationsDataState>(
      bloc: context.read<LocationsDataBloc>(),
      builder: (context, state) {
        if ((locationList?.results ?? []).isEmpty && state.state == LocationsState.Busy) {
          return const SizedBox.shrink();
        }
        if ((locationList?.results ?? []).isEmpty && state.state != LocationsState.Busy) {
          return Center(child: CustomText("Herhangi Bir Data Bulunamadı", context));
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: charachterGridView(context, locationList),
        );
      },
    );
  }

  GridView charachterGridView(BuildContext context, BaseListModel<Location>? locationList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Utils.normalPadding(context),
        mainAxisSpacing: Utils.normalPadding(context),
      ),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < (locationList?.results ?? []).length) {
          Location location = (locationList?.results ?? [])[index];
          return LocationCard(location: location, onTap: () => debugPrint(location.name));
        }
        return (context.watch<LocationsDataBloc>().state.state == LocationsState.Busy &&
                (context.watch<LocationsDataBloc>().state.locationListModel?.results ?? []).isNotEmpty)
            ? const Center(child: CustomProgressDialog())
            : const SizedBox();
      },
      itemCount: ((locationList?.results ?? []).length + 2),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.withBorder(
          "Bölgeler",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
