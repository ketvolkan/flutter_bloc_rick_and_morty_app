import 'package:dio/dio.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/models/base_list_model.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/models/character_model.dart';
import 'package:flutter_bloc_rick_and_morty_app/app/models/general_response.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/constants/endpoints.dart';
import 'package:flutter_bloc_rick_and_morty_app/core/services/network/network_service.dart';

import 'package:flutter_bloc_rick_and_morty_app/core/utils/serializer.dart';

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
