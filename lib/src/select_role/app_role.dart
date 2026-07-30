class CurrentAppRole {
  static AppRoleEnum? appRole;

  static void setAppRole(AppRoleEnum role) {
    appRole = role;
  }

  static AppRoleEnum getAppRoleType() {
    return appRole ?? AppRoleEnum.client; // Default to client if not set
  }

  static bool get isClient => appRole == AppRoleEnum.client;

  static bool get isProvider => appRole == AppRoleEnum.provider;
}

enum AppRoleEnum {
  client("client"),
  provider("provider");

  final String apiValue;

  const AppRoleEnum(this.apiValue);

  static AppRoleEnum? fromJson(String apiValue) {
    switch (apiValue) {
      case "client":
        return AppRoleEnum.client;
      case "provider":
        return AppRoleEnum.provider;
    }
    return null;
  }

  String get title {
    switch (this) {
      case AppRoleEnum.client:
        return "";
      case AppRoleEnum.provider:
        return "";
    }
  }
}
