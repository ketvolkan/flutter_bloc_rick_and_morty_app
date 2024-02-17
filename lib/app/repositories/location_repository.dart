import 'package:dio/dio.dart';

import '../../core/constants/endpoints.dart';
import '../../core/services/network/network_service.dart';
import '../models/base_list_model.dart';
import '../models/general_response.dart';
import '../models/location_model.dart';

abstract class ILocationRepository {
  Future<BaseListModel> getLocationsList({required int page});
}

class LocationRepository implements ILocationRepository {
  late NetworkService _networkService;
  LocationRepository() {
    _networkService = NetworkService();
  }
  @override
  Future<BaseListModel<Location>> getLocationsList({required int page}) async {
    try {
      final response = await _networkService.networkManager.get("${Endpoints.location.path}/", queryParameters: {"page": page});
      return BaseListModel<Location>(type: Location()).fromJson(response.data);
    } on DioException catch (e) {
      throw GeneralResponse.fromJson(e.response?.data);
    }
  }
}
