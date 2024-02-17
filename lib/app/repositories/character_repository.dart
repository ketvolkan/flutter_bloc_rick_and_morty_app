import 'package:dio/dio.dart';
import '../models/base_list_model.dart';
import '../models/character_model.dart';
import '../models/general_response.dart';
import '../../core/constants/endpoints.dart';
import '../../core/services/network/network_service.dart';

import '../../core/utils/serializer.dart';

abstract class ICharacterRepository {
  Future<BaseListModel> getCharacterList({required int page});
}

class CharacterRepository implements ICharacterRepository {
  late NetworkService _networkService;
  CharacterRepository() {
    _networkService = NetworkService();
  }
  @override
  Future<BaseListModel<BaseModel>> getCharacterList({required int page}) async {
    try {
      final response = await _networkService.networkManager.get("${Endpoints.character.path}/", queryParameters: {"page": page});
      return BaseListModel<Character>(type: Character()).fromJson(response.data);
    } on DioException catch (e) {
      throw GeneralResponse.fromJson(e.response?.data);
    }
  }
}
