import '../../../../../core/core.dart';
import '../../../../select_role/app_role.dart';
import '../../../../authentication/domain/entities/user_entity.dart';

class ProviderEntity extends UserEntity {
  final bool isActive;

  const ProviderEntity({
    required super.id,
    required super.name,
    required super.mobile,
    required super.avatar,
    required super.isVerified,
    required super.currentProviderRole,
    required this.isActive,
  });

  const ProviderEntity.initial()
    : this(
        id: 0,
        name: '',
        mobile: '',
        avatar: const AttachmentEntity.empty(),
        isVerified: false,
        isActive: false,
        currentProviderRole: null,
      );

  @override
  ProviderEntity copyWith({
    int? id,
    String? name,
    String? mobile,
    AttachmentEntity? avatar,
    bool? isVerified,
    bool? isActive,
    bool? clearCurrentProviderRole,
    AppRoleEnum? currentProviderRole,
  }) {
    return ProviderEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      currentProviderRole: currentProviderRole ?? this.currentProviderRole,
    );
  }

  @override
  List<Object?> get props => super.props..add(isActive);
}
