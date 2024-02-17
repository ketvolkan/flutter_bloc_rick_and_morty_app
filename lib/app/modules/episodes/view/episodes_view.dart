import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../models/base_list_model.dart';
import '../../../models/episode_model.dart';
import '../../common/widgets/appbar/custom_app_bar.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/dialogs/custom_progress_dialog.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../bloc/episodes_state_bloc/episodes_data_bloc.dart';
import '../bloc/episodes_state_bloc/episodes_data_state.dart';
import '../widgets/episode_card.dart';
import 'episodes_controller.dart';

class EpisodesView extends StatefulWidget {
  const EpisodesView({super.key});

  @override
  State<EpisodesView> createState() => _EpisodesViewState();
}

class _EpisodesViewState extends State<EpisodesView> {
  EpisodesController episodesController = EpisodesController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    episodesController.getAllData(context);
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge && _scrollController.position.pixels != 0) {
          if (context.read<EpisodesDataBloc>().state.hasMoreData) episodesController.getAllData(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BaseListModel<Episode>? episodeList = context.watch<EpisodesDataBloc>().state.episodeListModel;
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: gridViewBlocBuilder(context, episodeList),
    );
  }

  BlocBuilder<EpisodesDataBloc, EpisodesDataState> gridViewBlocBuilder(BuildContext context, BaseListModel<Episode>? episodeList) {
    return BlocBuilder<EpisodesDataBloc, EpisodesDataState>(
      bloc: context.read<EpisodesDataBloc>(),
      builder: (context, state) {
        if ((episodeList?.results ?? []).isEmpty && state.state == EpisodesState.Busy) {
          return const SizedBox.shrink();
        }
        if ((episodeList?.results ?? []).isEmpty && state.state != EpisodesState.Busy) {
          return Center(child: CustomText("Herhangi Bir Data Bulunamadı", context));
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: charachterGridView(context, episodeList),
        );
      },
    );
  }

  GridView charachterGridView(BuildContext context, BaseListModel<Episode>? episodeList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: Utils.normalPadding(context),
        mainAxisSpacing: Utils.normalPadding(context),
      ),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < (episodeList?.results ?? []).length) {
          Episode episode = (episodeList?.results ?? [])[index];
          return EpisodeCard(episode: episode, onTap: () => debugPrint(episode.name));
        }
        return (context.watch<EpisodesDataBloc>().state.state == EpisodesState.Busy &&
                (context.watch<EpisodesDataBloc>().state.episodeListModel?.results ?? []).isNotEmpty)
            ? const Center(child: CustomProgressDialog())
            : const SizedBox();
      },
      itemCount: ((episodeList?.results ?? []).length + 3),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.withBorder(
          "Bölümler",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
