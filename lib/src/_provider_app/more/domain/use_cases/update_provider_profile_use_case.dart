// ignore_for_file: use_null_aware_elements

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/provider_entity.dart';
import '../repository/provider_more_repository.dart';

@Injectable()
class UpdateProviderProfileUseCase extends IUseCase<ProviderEntity, UpdateProviderProfileParams> {
  final ProviderMoreRepository _repository;

  UpdateProviderProfileUseCase(this._repository);
  @override
  Future<Either<Failure, ProviderEntity>> call(UpdateProviderProfileParams params) async {
    return await _repository.updateUserData(params);
  }
}

class UpdateProviderProfileParams {
  final AttachmentEntity? image;
  final String name;

  const UpdateProviderProfileParams({required this.image, required this.name});

  Map<String, dynamic> get toMap {
    final MultipartFile? file = image?.path.toMultipartFile;
    return {if (file != null) 'avatar': file, 'name': name, "_method": "put"};
  }
}
