abstract class AuthState {}

class LoggedAuthState extends AuthState {
  LoggedAuthState(this.name);

  final String name;
}

class LogoutAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}
