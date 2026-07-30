import '../../../../../core/core.dart';
import '../../../../authentication/data/models/api_user_model.dart';
import '../../../domain/entity/users/provider_entity.dart';

class ApiProviderModel extends ApiUserModel {
  final bool? isActive;

  ApiProviderModel({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required this.isActive,
  });

  factory ApiProviderModel.fromJson(Map<String, dynamic> json) => ApiProviderModel(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    avatar: json["avatar"] != null ? AttachmentEntity.fromNetwork(url: json["avatar"]) : null,
    isVerified: json["is_verified"],
    isActive: json["is_active"],
  );
}

extension ApiProviderModelEXT on ApiProviderModel {
  ProviderEntity get map => ProviderEntity(
    id: id ?? 0,
    name: name ?? '',
    mobile: mobile ?? '',
    avatar: avatar ?? const AttachmentEntity.empty(),
    isVerified: isVerified,
    isActive: isActive ?? false,
    currentProviderRole: null,
  );
}
