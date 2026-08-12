import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../models/api_city_model.dart';
import '../models/api_common_model.dart';

abstract class CommonDataSource {
  Future<Unit> changeLanguage(AppLanguageEnum lang);
  Future<List<ApiCityModel>> getCities();
  Future<List<ApiCommonModel>> getServices();
  Future<List<ApiCommonModel>> getBanks();
}

@Injectable(as: CommonDataSource)
class CommonDataSourceImp implements CommonDataSource {
  final DioHelper _dioHelper;

  const CommonDataSourceImp(this._dioHelper);

  @override
  Future<Unit> changeLanguage(AppLanguageEnum lang) async {
    try {
      await _dioHelper.post(url: "auth/change-language", body: {"language": lang.value});
      return unit;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ApiCityModel>> getCities() async {
    try {
      final response = await _dioHelper.get(url: '/shared-api/v1/cities', queryParameters: {'page': '0', 'limit': '0'});
      final List data = List.from(response['data']);
      return data.map((e) => ApiCityModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ApiCommonModel>> getServices() async {
    try {
      final response = await _dioHelper.get(url: '/shared-api/v1/services', queryParameters: {'page': '0', 'limit': '0'});
      final List data = List.from(response['data']);
      return data.map((e) => ApiCommonModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ApiCommonModel>> getBanks() async {
    try {
      final response = await _dioHelper.get(url: '/shared-api/v1/banks', queryParameters: {'page': '0', 'limit': '0'});
      final List data = List.from(response['data']);
      return data.map((e) => ApiCommonModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }
}
