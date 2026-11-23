import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../common/data/models/users/api_provider_model.dart';
import '../../../../common/domain/entity/users/provider_entity.dart';
import '../../../../select_role/app_role.dart';
import '../../domain/repository/provider_more_repository.dart';
import '../../domain/use_cases/provider_update_profile_use_case.dart';

@Injectable(as: ProviderMoreRepository)
class ProviderMoreRepositoryImp implements ProviderMoreRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorage;

  const ProviderMoreRepositoryImp(this._apiHelper, this._secureStorage);

  @override
  DomainServiceType<ProviderEntity> getUserData() async {
    return await failureCollect<ProviderEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.addToApiUrlPath("profile"));
      final data = ApiProviderModel.fromJson(result['data']["user"]);
      return Right(data.map);
    });
  }

  @override
  DomainServiceType<ProviderEntity> updateUserData(ProviderUpdateProfileParams params) async {
    return await failureCollect<ProviderEntity>(() async {
      final result = await _apiHelper.post(url: ApiConstants.addToApiUrlPath("profile"), body: params.toMap);
      ProviderEntity provider = ApiProviderModel.fromJson(result['data']["user"]).map;
      provider = provider.copyWith(currentAppRole: AppRoleEnum.provider);
      await _secureStorage.setCachedUser(provider.mapToCacheEntity);
      return Right(provider);
    });
  }
}
