import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/client_entity.dart';
import '../use_cases/client_update_profile_use_case.dart';

abstract class ClientMoreRepository {
  DomainServiceType<ClientEntity> getClientData();
  DomainServiceType<ClientEntity> updateClientData(ClientUpdateProfileParams params);
}
