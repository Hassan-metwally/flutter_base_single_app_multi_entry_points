part of core;

typedef CachedUser = CacheUserEntity;

class CacheUserEntity extends Equatable {
  final int id;
  final String name;
  final String avatar;
  final String mobile;
  final AppRoleEnum? currentAppRole;

  const CacheUserEntity({required this.id, required this.name, required this.avatar, required this.mobile, required this.currentAppRole});

  CacheUserEntity copyWith({int? id, String? name, String? avatar, String? mobile, AppRoleEnum? currentAppRole}) {
    return CacheUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      mobile: mobile ?? this.mobile,
      currentAppRole: currentAppRole ?? this.currentAppRole,
    );
  }

  @override
  List<Object?> get props => [id, name, avatar, mobile, currentAppRole];

  @override
  String toString() {
    return "[CachedUser] ----------------------------\n"
        "[ID] $id\n"
        "[Name] $name\n"
        "[Avatar] $avatar\n"
        "[Mobile] $mobile\n"
        "[Current Provider Role] $currentAppRole\n"
        "-----------------------------------------";
  }
}
