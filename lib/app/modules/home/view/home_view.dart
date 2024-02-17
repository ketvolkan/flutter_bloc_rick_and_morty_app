import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../models/base_list_model.dart';
import '../../../models/character_model.dart';
import '../../common/widgets/appbar/custom_app_bar.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/dialogs/custom_progress_dialog.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../bloc/home_state_bloc/home_data_bloc.dart';
import '../bloc/home_state_bloc/home_data_state.dart';
import '../widgets/character_card.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController = HomeController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    homeController.getAllData(context);
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge && _scrollController.position.pixels != 0) {
          if (context.read<HomeDataBloc>().state.hasMoreData) homeController.getAllData(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BaseListModel<Character>? charachterList = context.watch<HomeDataBloc>().state.charachterListModel;
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: BlocBuilder<HomeDataBloc, HomeDataState>(
        bloc: context.read<HomeDataBloc>(),
        builder: (context, state) {
          if ((charachterList?.results ?? []).isEmpty && state.state == HomeState.Busy) {
            return const SizedBox.shrink();
          }
          if ((charachterList?.results ?? []).isEmpty && state.state != HomeState.Busy) {
            return Center(child: CustomText("Herhangi Bir Data Bulunamadı", context));
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: charachterGridView(context, charachterList),
          );
        },
      ),
    );
  }

  GridView charachterGridView(BuildContext context, BaseListModel<Character>? charachterList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Utils.normalPadding(context),
        mainAxisSpacing: Utils.normalPadding(context),
      ),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < (charachterList?.results ?? []).length) {
          Character character = (charachterList?.results ?? [])[index];
          return CharachterCard(character: character, onTap: () => debugPrint(character.name));
        }
        return (context.watch<HomeDataBloc>().state.state == HomeState.Busy &&
                (context.watch<HomeDataBloc>().state.charachterListModel?.results ?? []).isNotEmpty)
            ? const Center(child: CustomProgressDialog())
            : const SizedBox();
      },
      itemCount: ((charachterList?.results ?? []).length + 2),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) => CustomAppBar(
        title: CustomText.custom(
          "Karakterler",
          context,
          centerText: true,
          fontFamily: AppConstants.rickAndMortFont,
          textSize: Utils.extraHighTextSize(context) * 1.5,
          bold: true,
        ),
      );
}
