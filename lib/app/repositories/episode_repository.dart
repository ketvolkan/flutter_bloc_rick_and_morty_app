import 'package:dio/dio.dart';

import '../../core/constants/endpoints.dart';
import '../../core/services/network/network_service.dart';
import '../models/base_list_model.dart';
import '../models/episode_model.dart';
import '../models/general_response.dart';

abstract class IEpisodeRepository {
  Future<BaseListModel> getEpisodesList({required int page});
}

class EpisodeRepository implements IEpisodeRepository {
  late NetworkService _networkService;
  EpisodeRepository() {
    _networkService = NetworkService();
  }
  @override
  Future<BaseListModel<Episode>> getEpisodesList({required int page}) async {
    try {
      final response = await _networkService.networkManager.get("${Endpoints.episode.path}/", queryParameters: {"page": page});
      return BaseListModel<Episode>(type: Episode()).fromJson(response.data);
    } on DioException catch (e) {
      throw GeneralResponse.fromJson(e.response?.data);
    }
  }
}
