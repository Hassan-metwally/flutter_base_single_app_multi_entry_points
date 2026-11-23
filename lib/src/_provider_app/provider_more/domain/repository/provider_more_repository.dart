import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/provider_entity.dart';
import '../use_cases/provider_update_profile_use_case.dart';

abstract class ProviderMoreRepository {
  DomainServiceType<ProviderEntity> getUserData();
  DomainServiceType<ProviderEntity> updateUserData(ProviderUpdateProfileParams params);
}
