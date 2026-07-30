part of core;

abstract class AppAuthenticationState extends Equatable {
  const AppAuthenticationState();
  AppRoleEnum? get appRole => null;

  @override
  List<Object?> get props => [];
}

class AuthAuthenticatedState extends AppAuthenticationState {
  final CachedUser user;

  const AuthAuthenticatedState({required this.user});

  @override
  AppRoleEnum? get appRole => user.currentAppRole;

  @override
  List<Object?> get props => [user];
}

class AuthUninitialized extends AppAuthenticationState {}

class AuthLogInPageState extends AppAuthenticationState {}

class AuthLogOutState extends AppAuthenticationState {}

class GuestState extends AppAuthenticationState {
  @override
  AppRoleEnum? get appRole => AppRoleEnum.client;
}

class AuthUnauthenticated extends AppAuthenticationState {}
