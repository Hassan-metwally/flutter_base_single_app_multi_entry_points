import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../common/data/models/users/api_client_model.dart';
import '../../../../common/domain/entity/users/client_entity.dart';
import '../../../../select_role/app_role.dart';
import '../../domain/repository/client_more_repository.dart';
import '../../domain/use_cases/client_update_profile_use_case.dart';

@Injectable(as: ClientMoreRepository)
class ClientMoreRepositoryImp implements ClientMoreRepository {
  final DioHelper _apiHelper;
  final SecureStorageRepository _secureStorage;

  const ClientMoreRepositoryImp(this._apiHelper, this._secureStorage);
  @override
  DomainServiceType<ClientEntity> getClientData() async {
    return await failureCollect<ClientEntity>(() async {
      final result = await _apiHelper.get(url: ApiConstants.addToApiUrlPath("profile"));
      ClientEntity client = ApiClientModel.fromJson(result['data']["user"]).map;
      client = client.copyWith(currentAppRole: AppRoleEnum.client);
      await _secureStorage.setCachedUser(client.mapToCacheEntity);
      return Right(client);
    });
  }

  @override
  DomainServiceType<ClientEntity> updateClientData(ClientUpdateProfileParams params) async {
    return await failureCollect<ClientEntity>(() async {
      final result = await _apiHelper.post(url: ApiConstants.addToApiUrlPath("profile"), body: params.toMap);
      final ClientEntity data = ApiClientModel.fromJson(result['data']["user"]).map;
      await _secureStorage.setCachedUser(data.mapToCacheEntity);
      return Right(data);
    });
  }
}
